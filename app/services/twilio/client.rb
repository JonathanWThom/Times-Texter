class Twilio::Client
  require 'twilio-ruby'

  def initialize
  end

  def run
    account_sid = ENV["TWILIO_ACCOUNT_SID"]
    auth_token = ENV["TWILIO_AUTH_TOKEN"]
    body = News::Nyt::Client.new.run

    @client = Twilio::REST::Client.new(account_sid, auth_token)
    message = @client.messages.create(
      body: body,
      to: ENV["MY_PHONE_NUMBER"],
      from: ENV["TWILIO_PHONE_NUMBER"]
    )
  end
end
