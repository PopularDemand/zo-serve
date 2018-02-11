class Selection < ApplicationRecord

   # Associtations
  has_many :games_selections
  has_many :games, through: :games_selections
  belongs_to :actual_icon, class_name: 'Icon'
  belongs_to :selected_icon, class_name: 'Icon'

end
