class Game < ApplicationRecord
  has_many :plies, dependent: :destroy
  has_many :tags
  has_many :collections, through: :tags
  belongs_to :white_player, class_name: "Player", optional: true
  belongs_to :black_player, class_name: "Player", optional: true
end
