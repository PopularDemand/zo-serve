class Icon < ApplicationRecord

  # Associations
  has_many :randomized_selections,
           class_name: 'Selection',
           foreign_key: :actual_icon_id
  has_many :user_selections,
           class_name: 'Selection',
           foreign_key: :selected_icon_id
end
