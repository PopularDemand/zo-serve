class GameChannel < ApplicationCable::Channel
  def subscribed
    if (params[:is_receiver])
      stream_from "game_receiver_#{params[:game_id]}"
    elsif (params[:is_sender])
      stream_from "game_sender_#{params[:game_id]}"
    end
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  def initialize_round
    game = Game.find(params[:game_id])
    if (game)
      game.initializeRound
    else
      debugger
    end
  end

  # Partner function to client#send
  def receive(data)
    puts data
  end
end
