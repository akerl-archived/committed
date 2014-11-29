require 'basiccache'
require 'githubstats'

module Committed
  ##
  # Common helper methods
  module Util
    RESULT_CACHE = BasicCache::TimeCache.new(lifetime: 900)

    def check(user)
      RESULT_CACHE.cache(user) do
        begin
          GithubStats.new(user).today > 0
        rescue RuntimeError
          :error
        end
      end
    end

    def status_message(user)
      result = check user
      return 'Error processing request' if result == :error
      "#{user} has #{'not ' unless result} committed today"
    end
  end
end
