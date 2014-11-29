require 'twilio-ruby'

module Committed
  ##
  # SMS handler for TwiML
  module SMS
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
