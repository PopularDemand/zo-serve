class CreateGames < ActiveRecord::Migration[5.0]
  def change
    create_table :games do |t|
      t.integer :receiver_id, null: false
      t.timestamps
    end
  end
end
