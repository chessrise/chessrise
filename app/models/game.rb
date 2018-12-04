class Game < ApplicationRecord
  has_many :plies, dependent: :destroy
  has_many :collections
  has_many :tags, through: :collections
end
