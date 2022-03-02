require_relative '../slackbot/chambas_bot'
require 'httparty'


class CommandsController < ApplicationController
  skip_before_action :verify_authenticity_token
	

  def create
		bot = ChambasBot.new
		dialog = helpers.generate_dialog
		bot.bot_dialog(dialog.to_json, params[:trigger_id])
		render status: 200, json: ''
		# HTTParty.post(params[:response_url], { body: message.to_json, headers: {
		# 	"Content-Type" => "application/json"
		#  }
		# })
			
	end

	def dialog
		bot = ChambasBot.new
		data = JSON.parse(params[:payload])
		submission = data["submission"]
		if helpers.check_salary(submission["chamba_salario"]) 
			if helpers.check_date(submission["chamba_expiracion"])
				chamba = Chambitum.new(title: submission["chamba_titulo"], location: submission["chamba_ubicacion"],
				description:submission["chamba_descripcion"],organizationo:submission["chamba_organizacion"],
				salary:submission["chamba_salario"],puesto:submission["chamba_puesto"],
				requerimientos:submission["chamba_requerimientos"],etiquetas: submission["chamba_etiquetas"],
				expiracion:submission["chamba_expiracion"])
				if chamba.save
					bot.mensaje_bueno(data["user"]["name"])
				else
					bot.mensaje_malo(data["user"]["name"])
					render status: 200, json: ''
				end
			
			else 
				error = helpers.generate_date_error
				render status: 200, json: error.to_json
			end
		else
			error = helpers.generate_salary_error
			render status: 200, json: error.to_json
		end
	end


  # def command_params
  #   params.permit(:text, :token, :user_id, :response_url,:user,:trigger_id)
  # end

end
