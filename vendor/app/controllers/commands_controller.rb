require 'slack-ruby-client'
require 'httparty'


class CommandsController < ApplicationController
  skip_before_action :verify_authenticity_token

  def create

    #{r}eturn render json: {}, status: 403 unless valid_slack_token?
    #{}CommandWorker.perform_async(command_params.to_h)
    render json: { response_type: "in_channel" }, status: :created
    p "Bingo"
=begin
    Slack.configure do |config|
      config.token = ENV['SLACK_API_TOKEN']
      raise 'Missing ENV[SLACK_API_TOKEN]!' unless config.token
    end
    client = Slack::Web::Client.new
    client.auth_test
    client.chat_postMessage(channel: '#general', text: 'respuesta de prueba')
=end    
message = {
	"blocks": [
		{
			"type": "input",
			"element": {
				"type": "plain_text_input",
				"action_id": "plain_text_input-action"
			},
			"label": {
				"type": "plain_text",
				"text": "Name",
				"emoji": true
			}
		},
		{
			"type": "input",
			"element": {
				"type": "plain_text_input",
				"action_id": "plain_text_input-action"
			},
			"label": {
				"type": "plain_text",
				"text": "Skills",
				"emoji": true
			}
		},
		{
			"type": "input",
			"element": {
				"type": "plain_text_input",
				"action_id": "plain_text_input-action"
			},
			"label": {
				"type": "plain_text",
				"text": "Salary",
				"emoji": true
			}
		},
		{
			"type": "section",
			"text": {
				"type": "mrkdwn",
				"text": "This is a section block with a button."
			},
			"accessory": {
				"type": "button",
				"text": {
					"type": "plain_text",
					"text": "Click Me",
					"emoji": true
				},
				"value": "click_me_123",
				"url": "https://090e-2806-102e-e-3df0-b95d-9704-e0a1-4d1e.ngrok.io/commands/dialog",
				"action_id": "button-action"
			}
		}
	]
}

par = params[:response_url]
p par 
HTTParty.post(params[:response_url], { body: message.to_json, headers: {
  "Content-Type" => "application/json"
}
})
    
end

def dialog
  p "bingo"
end

  def valid_slack_token?
    params[:token] == ENV["SLACK_SLASH_COMMAND_TOKEN"]
  end

  def command_params
    params.permit(:text, :token, :user_id, :response_url)
  end

end
