require 'basiccache'
require 'githubstats'

module Committed
  ##
  # Common helper methods
  module Util
    MESSAGES = {
      true => '%{user} has committed today (%{score})',
      false => '%{user} has not committed today'
    }.freeze

    def check(user)
      Committed::RESULT_CACHE.cache(user) do
        begin
          stats = GithubStats.new(user)
          [stats.today.positive?, stats.today]
        rescue RuntimeError
          :error
        end
      end
    end

    def status_message(user)
      result, today = check user
      return 'Error processing request' if result == :error
      # rubocop:disable Style/FormatString
      MESSAGES[result] % { user: user, score: today }
    end
  end
end
