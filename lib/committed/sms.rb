require 'twilio-ruby'

module Committed
  ##
  # SMS handler for TwiML
  module SMS
    def guess_user(_, body)
      [
        body_search(body),
        Committed::DEFAULT_USER
      ].compact.first
    end

    def body_search(body)
      body.match(/^user (?<user>[\w-]+)$/i)[:user]
    rescue NoMethodError
      nil
    end
  end
end
