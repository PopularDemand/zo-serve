class Icon < ApplicationRecord

  ##############
  # Associations
  ##############

  has_many :randomized_selections,
           class_name: 'Selection',
           foreign_key: :actual_icon_id
  has_many :user_selections,
           class_name: 'Selection',
           foreign_key: :selected_icon_id

  ###############
  # Class Methods
  ###############

  def self.random_set(count = 4)
    limit(count).order("RANDOM()")
  end

  ##################
  # Instance Methods
  ##################

  def as_json(opts = nil)
    super(only: [:color, :shape, :id])
  end

  def serialized
    { color: color, shape: shape, id: id }
  end
end
