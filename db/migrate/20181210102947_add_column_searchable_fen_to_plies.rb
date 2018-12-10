class AddColumnSearchableFenToPlies < ActiveRecord::Migration[5.2]
  def change
    add_column :plies, :searchable_fen, :string
    add_index  :plies, :searchable_fen
  end
end
