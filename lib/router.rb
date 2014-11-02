require 'twilio-ruby'
require 'sinatra/base'

##
# The real deal, yo
class App < Sinatra::Base
  get '/' do
    twiml = Twilio::TwiML::Response.new do |r|
      r.Message 'Hey Monkey. Thanks for the message!'
    end
    twiml.text
  end
end
