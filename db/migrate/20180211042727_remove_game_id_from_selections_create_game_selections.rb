class RemoveGameIdFromSelectionsCreateGameSelections < ActiveRecord::Migration[5.0]
  def change
    create_table :games_selections do |t|
      t.integer :selection_id, null: false
      t.integer :game_id, null: false

      t.timestamps
    end

    add_index :games_selections, [:selection_id, :game_id]

    remove_column :selections, :game_id, :integer, null: false
  end
end
