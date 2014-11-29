require 'sinatra/base'
require 'basiccache'
require 'githubstats'

module Committed
  ##
  # Common helper methods
  module Util < Sinatra::Base
    RESULT_CACHE = BasicCache::TimeCache.new(lifetime: 900)

    def check(user)
      RESULT_CACHE.cache(user) do
        GithubStats.new(user).today > 0
      end
    end
  end
end
