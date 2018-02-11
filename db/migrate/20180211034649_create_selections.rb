class CreateSelections < ActiveRecord::Migration[5.0]
  def change
    create_table :selections do |t|
      t.integer :actual_icon_id, null: false
      t.integer :selected_icon_id, null: false
      t.integer :game_id, null: false
      t.integer :count, default: 0

      t.timestamps
    end
  end
end
