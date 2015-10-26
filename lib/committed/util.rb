require 'basiccache'
require 'githubstats'

module Committed
  ##
  # Common helper methods
  module Util
    def check(user)
      Committed::RESULT_CACHE.cache(user) do
        begin
          stats = GithubStats.new(user)
          [stats.today > 0, stats.streak]
        rescue RuntimeError
          :error
        end
      end
    end

    def status_message(user)
      result, streak = check user
      return 'Error processing request' if result == :error
      "#{user} has #{'not ' unless result}committed today (#{streak})"
    end
  end
end
