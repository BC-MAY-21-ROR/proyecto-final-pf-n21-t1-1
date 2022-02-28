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
  	bot.mensaje_bueno(data["user"]["name"])
		render status: 200, json: ''
	end

  # def command_params
  #   params.permit(:text, :token, :user_id, :response_url,:user,:trigger_id)
  # end

end
