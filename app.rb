require_relative 'config/environment'

class GameApp < Sinatra::Base
  get '/' do
    erb :intro
  end

  get '/rps/:play' do
    user_move = params[:play]
    @game = RPSGame.new(user_move.to_sym)
    if @game.won?
      @result = "YOU"
    elsif @game.lost?
      @result = "COMPUTER"
    elsif @game.tied?
      @result = "NO ONE"
    end
    erb :rps_game
  end
end
