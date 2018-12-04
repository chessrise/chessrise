class Ply < ApplicationRecord
  belongs_to :game
  belongs_to :parent, class_name: "Ply", optional: true
  has_many :comments, dependent: :destroy
end
