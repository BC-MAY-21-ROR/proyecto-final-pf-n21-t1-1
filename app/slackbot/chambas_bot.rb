require 'slack-ruby-client'

class ChambasBot
  def initialize()
    Slack.configure do |config|
      config.token = ENV['SLACK_API_TOKEN']
      raise 'Missing ENV[SLACK_API_TOKEN]!' unless config.token
    end
    @client = Slack::Web::Client.new
  
    @client.auth_test
  end

  def mensaje_prueba
    @client.chat_postMessage(channel: "general", text:'mensaje prueba')
  end

  def mensaje_bueno(user_name)
    @client.chat_postMessage(channel: "general", text:"Chambita agregada <@#{user_name}>")
  end

  def mensaje_malo(user_name)
    @client.chat_postMessage(channel: "general", text:"Hubo un fallo al agregar la chambita :( <@#{user_name}>")
  end

  def bot_dialog(json, trigger)
    @client.dialog_open(dialog: json, trigger_id: trigger)
  end
  
end
