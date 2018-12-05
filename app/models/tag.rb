class Tag < ApplicationRecord
  belongs_to :game
  belongs_to :collection
end
