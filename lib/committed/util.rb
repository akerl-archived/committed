require 'basiccache'
require 'githubstats'

module Committed
  ##
  # Common helper methods
  module Util
    def check(user)
      Committed::RESULT_CACHE.cache(user) do
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
      "#{user} has #{'not ' unless result}committed today"
    end
  end
end
