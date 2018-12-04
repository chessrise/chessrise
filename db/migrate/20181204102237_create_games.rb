class CreateGames < ActiveRecord::Migration[5.2]
  def change
    create_table :games do |t|
      t.string :event
      t.string :site
      t.date :date
      t.integer :round
      t.string :result
      t.integer :ply_count_total
      t.string :eco_code
      t.text :initial_position
      t.integer :elo_white
      t.integer :elo_black

      t.timestamps
    end
  end
end
