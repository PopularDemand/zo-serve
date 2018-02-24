class Selection < ApplicationRecord

   # Associations
  belongs_to :game
  belongs_to :actual_icon, class_name: 'Icon'
  belongs_to :selected_icon, class_name: 'Icon', optional: true

  def as_json(opts = nil)
    super({ 
      except: [:actual_icon_id, :selected_icon_id],
      methods: [:actual, :selected]
    })
  end

  def icons
    { actual: actual_icon, selected: selected_icon}
  end

  def actual
    actual_icon.as_json
  end

  def selected
    selected_icon.as_json
  end

end
