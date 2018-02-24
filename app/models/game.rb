class Game < ApplicationRecord
  NUM_SELECTIONS = 5

  # Associations
  has_many :selections
  belongs_to :receiver, class_name: 'User'

  def initialize_round
    icons = Icon.random_set()
    actual_icon = icons.sample
    selection = selections.create!(actual_icon: actual_icon)
    params = { round: selections.count, actual_icon: actual_icon, icons: icons, type: 'INITIALIZE_ROUND' }
    ActionCable.server.broadcast("game_receiver_#{id}", params)
  end

  def record_selected_icon(id)
    selections.last.update!(selected_icon_id: id)
  end

  def over?
    selections_filled
  end

  def end
    params = { type: 'GAME_OVER', game: self, selections: selections }
    ActionCable.server.broadcast("game_receiver_#{id}", params)
    ActionCable.server.broadcast("game_sender_#{id}", params)
  end

  private

    def selections_filled
      selections.count >= Game::NUM_SELECTIONS
    end
end
