require 'sinatra/base'

require 'lib/committed/sms'
require 'lib/committed/util'
require 'lib/committed/db'

##
# Module for doing things
module Committed
  DEFAULT_USER = ENV['COMMITTED_DEFAULT_USER'] || 'akerl'
  RESULT_CACHE = BasicCache::TimeCache.new(lifetime: 900)
  DATABASE = ENV['COMMITTED_DB'] ? Committed::DB.new : Committed::NullDB.new

  ##
  # Base handler for application
  class Base < Sinatra::Base
    include Committed::SMS
    include Committed::Util

    get '/' do
      redirect to("/user/#{DEFAULT_USER}"), 307
    end

    get %r{^/user/([\w-]+)$} do |user|
      status_message(user)
    end

    post '/sms' do
      Twilio::TwiML::Response.new do |r|
        r.Message parse_message(params[:From], params[:Body])
      end.text
    end
  end
end
