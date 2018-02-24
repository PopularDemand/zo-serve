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

  # Partner function to client#send
  def receive(data)
    puts data
  end

  def initialize_round
    game = Game.find(params[:game_id])
    game.initialize_round
  end

  def make_selection(data)
    game = Game.find(params[:game_id])
    game.record_selected_icon(data['id'])
    game.over? ? game.end : game.initialize_round
  end

end
