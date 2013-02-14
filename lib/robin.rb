require 'sinatra/base'

class Robin < Sinatra::Base
  get '/' do
    'Hello Robin!'
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
