require 'sinatra/base'
require 'twilio-ruby'

module Committed
  ##
  # SMS handler for TwiML
  class SMS < Sinatra::Base
    post '/sms' do
      @user = guess_user params[:From], params[:Body]
      @has_committed = check @user
      Twilio::TwiML::Response.new do |r|
        r.Message "#{@user} has #{'not ' unless @has_committed}committed today"
      end.text
    end

    def guess_user(_, body)
      [
        body_search(body),
        DEFAULT_USER
      ].find { |user| user }
    end

    def body_search(body)
      body.match(/^user (?<user>[\w-]+)$/i)[:user]
    rescue NoMethodError
      nil
    end
  end
end
