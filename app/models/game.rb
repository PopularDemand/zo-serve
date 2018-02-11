class Game < ApplicationRecord

  # Associtations
  has_many :games_selections
  has_many :selections, through: :games_selections
  belongs_to :receiver, class_name: 'User'
end
