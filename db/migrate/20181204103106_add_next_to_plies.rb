class AddNextToPlies < ActiveRecord::Migration[5.2]
  def change
    add_column :plies, :next_id, :integer
    add_foreign_key :plies, :plies, column: :next_id
  end
end
