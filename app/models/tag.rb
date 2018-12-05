class Tag < ApplicationRecord
  belongs_to :user

  has_many :collections
  has_many :games, through: :collections
end
