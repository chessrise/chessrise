class AddBlackPlayerIdToGames < ActiveRecord::Migration[5.2]
  def change
    add_column :games, :black_player_id, :integer
    add_foreign_key :games, :players, column: :black_player_id
  end
end
