require 'sinatra/base'
require_relative 'services/manager'

class Robin < Sinatra::Base
  #for testing design
  set :root, File.expand_path('../../', __FILE__)

  get '/' do
    erb :index
  end
  
  post '/connect' do
    begin
      @manager = Manager.connect params[:redis_address]
      erb :redis_instance, locals:{ keys: @manager.get_keys}
    rescue
      "ooops"
    end
  end

  # testing
  get '/test' do
    erb :test
  end
  # start the server if ruby file executed directly
  run! if app_file == $0
end
