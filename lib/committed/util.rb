require 'basiccache'
require 'githubstats'

module Committed
  ##
  # Common helper methods
  module Util
    MESSAGES = {
      true => '%<user>s has committed today (%<score>s)',
      false => '%<user>s has not committed today'
    }.freeze

    def check(user)
      Committed::RESULT_CACHE.cache(user) do
        stats = GithubStats.new(user)
        [stats.today.positive?, stats.today]
      rescue RuntimeError
        :error
      end
    end

    def status_message(user)
      result, today = check user
      return 'Error processing request' if result == :error
      # rubocop:disable Style/FormatString
      MESSAGES[result] % { user: user, score: today }
      # rubocop:enable Style/FormatString
    end
  end
end
