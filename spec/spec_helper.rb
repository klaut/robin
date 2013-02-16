# require_relative "... my app"

require 'sinatra'
require 'rack/test'
 
set :environment, :test
 
#specify that the app is a Sinatra app
def app
  Sinatra::Application
end
 
REDIS_TEST_URL = "redis://127.0.0.1:6379/1"
#make Rack::Text available to all spec contexts
RSpec.configure do |config|
  config.include Rack::Test::Methods
end
