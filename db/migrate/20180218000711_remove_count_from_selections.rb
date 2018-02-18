class RemoveCountFromSelections < ActiveRecord::Migration[5.0]
  def change
    remove_column :selections, :count, :integer, default: 0
  end
end
