$LOAD_PATH.unshift '.'
require 'lib/committed'
use Rack::ShowExceptions
run Committed::Base.new
