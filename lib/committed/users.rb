require 'yaml'
require 'digest'

##
# Add logic for handling user memory
class Committed
  USER_FILE = ENV['COMMITTED_USER_FILE'] || 'users.yml'

  def load_users
    YAML.load(File.read(USER_FILE))
  rescue
    {}
  end

  def look_up_number(number)
    @users ||= load_users
    @users[Digest::SHA256.hexdigest number]
  end
end
