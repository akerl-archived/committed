require 'twilio-ruby'
require 'sinatra/base'

##
# The real deal, yo
class App < Sinatra::Base
  post '/' do
    twiml = Twilio::TwiML::Response.new do |r|
      r.Message 'Hey Monkey. Thanks for the message!'
    end
    twiml.text
  end

  get '/' do
    'You must be lost'
  end
end
