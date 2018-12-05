class Player < ApplicationRecord
  has_many :games

  def fullname
    "#{first_name.capitalize} #{last_name.capitalize}"
  end
end
