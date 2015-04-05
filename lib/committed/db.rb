require 'redis'

module Committed
  ##
  # DB object, stores users in Redis
  class DB
    def initialize
      @store = Redis.new
    end

    def register(from, user)
      @store[from] = user
      "Registered as #{user}"
    rescue Errno::ECONNREFUSED
      'Registration failed'
    end

    def lookup(from)
      @store[from]
    rescue KeyError
      nil
    end
  end

  ##
  # NullDB, mocks DB and stores nothing
  class NullDB
    def register(_, _)
      'Registration is disabled'
    end

    def lookup(_)
    end
  end
end
