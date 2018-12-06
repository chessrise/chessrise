class Game < ApplicationRecord
  has_many :plies, dependent: :destroy
  has_many :tags
  has_many :collections, through: :tags
  belongs_to :white_player, class_name: "Player", optional: true
  belongs_to :black_player, class_name: "Player", optional: true

  def main_sorted_plies
    main_plies = plies.select { |p| p.status = "main" }
    main_plies.sort_by { |p| p.ply_count }
  end
end
