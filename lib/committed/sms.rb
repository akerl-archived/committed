require 'twilio-ruby'

module Committed
  ##
  # SMS handler for TwiML
  module SMS
    def parse_message(from, body)
      case body
      when /^register (?<user>[\w-]+)$/i
        user = Regexp.last_match[:user]
        DATABASE.register from, user
      when /^user (?<user>[\w-]+)$/i
        status_message Regexp.last_match[:user]
      else
        status_message(DATABASE.lookup(from) || DEFAULT_USER)
      end
    end
  end
end
