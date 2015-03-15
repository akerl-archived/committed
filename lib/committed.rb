require 'sinatra/base'

require 'lib/committed/sms'
require 'lib/committed/util'

module Committed
  DEFAULT_USER = ENV['COMMITTED_DEFAULT_USER'] || 'akerl'
  RESULT_CACHE = BasicCache::TimeCache.new(lifetime: 900)

  ##
  # Base handler for application
  class Base < Sinatra::Base
    include Committed::SMS
    include Committed::Util

    get '/' do
      redirect to("/user/#{Committed::DEFAULT_USER}"), 307
    end

    get %r{^/user/([\w-]+)$} do |user|
      status_message(user)
    end

    post '/sms' do
      @user = guess_user params[:From], params[:Body]
      Twilio::TwiML::Response.new do |r|
        r.Message status_message(user)
      end.text
    end
  end
end
