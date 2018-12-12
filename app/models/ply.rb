class Ply < ApplicationRecord
  belongs_to :game
  belongs_to :parent, class_name: "Ply", optional: true
  has_many :comments, dependent: :destroy

  def white?
    !(ply_count % 2).zero?
  end

  def display_move_number
    if white? && ply_count == 1
      return "1"
    elsif white? && ply_count != 1
      return "#{(ply_count + 1) / 2}"
    end
  end

end
