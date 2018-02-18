class Icon < ApplicationRecord

  # Associations
  has_many :randomized_selections,
           class_name: 'Selection',
           foreign_key: :actual_icon_id
  has_many :user_selections,
           class_name: 'Selection',
           foreign_key: :selected_icon_id

  def self.random_set(count = 4)
    limit(count).order("RANDOM()")
  end
end
