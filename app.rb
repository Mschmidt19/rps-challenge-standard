require 'sinatra/base'
require './lib/game'
require './lib/player'

class Rps < Sinatra::Base

  configure do
    set :static, true
    set :public_folder, 'public'
  end

  get '/' do
    erb :index
  end

  post '/name' do
    player1 = Player.new(params[:player_name])
    @game = Game.create(player1)
    redirect '/play'
  end

  before do
    @game = Game.instance
  end

  get '/play' do
    erb :play
  end

  post '/result' do
    @game.player1.make_choice(params[:attack_choice])
    @game.player2.make_random_choice
    redirect '/result'
  end

  get '/result' do
    erb :result
  end

  post '/play_again' do
    player1 = Player.new(@game.player1.name)
    player2 = Player.new(@game.player2.name)
    @game = Game.create(player1, player2)
    redirect '/play'
  end

  # starts the server if ruby file is executed directly
  run! if app_file == $0

end
