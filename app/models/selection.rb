class Selection < ApplicationRecord

   # Associations
  belongs_to :game
  belongs_to :actual_icon, class_name: 'Icon'
  belongs_to :selected_icon, class_name: 'Icon'

end
