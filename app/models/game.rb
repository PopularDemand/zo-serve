class Game < ApplicationRecord

  # Associtations
  has_many :selections
  belongs_to :receiver, class_name: 'User'

  def initializeRound
    if (selections.count >= 5)
      end_game
      return
    end

    # populate all icons
    icons = Icon.random_set()

    # selecton one icon
    actual_icon = icons.sample

    # create new selection
    selection = selections.create(actual_icon: actual_icon)

    # send sender actual
    params = { round: selections.count, actual_icon: actual_icon, icons: icons }
    ActionCable.server.broadcast("game_receiver_#{id}", params)
    # send receiver group containing actual
  end

  def end_game
    params = { type: 'GAME_COMPLETE', game: self, selections: selections }
    ActionCable.server.broadcast("game_receiver_#{id}", params)
    ActionCable.server.broadcast("game_sender_#{id}", params)
  end
end
