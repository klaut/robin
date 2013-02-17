require 'sinatra/base'
require_relative 'services/manager'

class Robin < Sinatra::Base
  get '/' do
    erb :index
  end

  post '/connect' do
    begin
      @manager = Manager.connect params[:redis_address]
      "hey, #{@manager.list_keys}"
    rescue
      "ooops"
    end
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
