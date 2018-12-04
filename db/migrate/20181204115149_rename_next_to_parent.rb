class RenameNextToParent < ActiveRecord::Migration[5.2]
  def change
    rename_column :plies, :next_id, :parent_id
    add_foreign_key :plies, :plies, column: :parent_id
  end
end
