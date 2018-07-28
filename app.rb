require 'sinatra/base'
require './lib/game'

class Rps < Sinatra::Base

  get '/' do
    erb :index
  end

  #starts the server if ruby file is executed directly
  run! if app_file == $0

end
