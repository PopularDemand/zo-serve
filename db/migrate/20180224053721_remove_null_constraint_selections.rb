class RemoveNullConstraintSelections < ActiveRecord::Migration[5.0]
  def change
    change_column_null :selections, :selected_icon_id, :integer, true
  end
end
