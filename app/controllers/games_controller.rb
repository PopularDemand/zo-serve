class GamesController < ApplicationController

  def create
    game = Game.new(game_params)
    if game.save
      render json: { game: game }
    else
      render json: { error: 'unable to create game', reasons: game.errors }
    end
  end

  private

    def game_params
      params.require(:game).permit(:receiver_id)
    end
end
