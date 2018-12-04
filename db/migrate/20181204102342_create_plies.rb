class CreatePlies < ActiveRecord::Migration[5.2]
  def change
    create_table :plies do |t|
      t.references :game, foreign_key: true
      t.integer :ply_count
      t.string :move
      t.text :fen
      t.string :status

      t.timestamps
    end
  end
end
