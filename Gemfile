path = File.dirname(ENV['BUNDLE_GEMFILE'] || '.')
ruby File.read(File.join(path, '.circle-ruby')).chomp
source 'https://rubygems.org'

gem 'basiccache', '~> 1.0.0'
gem 'githubstats', '~> 3.0.0'
gem 'redis', '~> 4.1.0'
gem 'sinatra', '~> 2.0.0'
gem 'thin', '~> 1.7.0'
gem 'twilio-ruby', '~> 5.25.1'

group :development do
  gem 'codecov', '~> 0.1.1'
  gem 'goodcop', '~> 0.8.0'
end
