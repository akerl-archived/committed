require 'twilio-ruby'
require 'sinatra/base'
require 'githubstats'
require 'basiccache'

##
# The real deal, yo
class Committed < Sinatra::Base
  DEFAULT_USER = ENV['COMMITTED_DEFAULT_USER'] || 'akerl'
  RESULT_CACHE = BasicCache::TimeCache.new(lifetime: 900)

  get '/' do
    redirect to("/user/#{DEFAULT_USER}"), 307
  end

  get %r{^/user/([\w-]+)$} do |user|
    @user = user
    @has_committed = Committed.check user
    "#{@user} has #{'not ' unless @has_committed} committed today"
  end

  post '/sms' do
    @user = Committed.guess_user params[:From], params[:Body]
    @has_committed = Committed.check @user
    Twilio::TwiML::Response.new do |r|
      r.Message "#{@user} has #{'not ' unless @has_committed} committed today"
    end.text
  end

  def self.check(user)
    RESULT_CACHE.cache(user) do
      GithubStats.new(user).today > 0
    end
  end
  
  def self.guess_user(from = '', body = '')
    body_search = body.match(/^user ([\w-]+)$/)
    body_search ? body_search[:user] : DEFAULT_USER
  end
end
