class AddWhitePlayerIdToGames < ActiveRecord::Migration[5.2]
  def change
    add_column :games, :white_player_id, :integer
    add_foreign_key :games, :players, column: :white_player_id
  end
end
