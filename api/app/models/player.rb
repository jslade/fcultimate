class Player < ApplicationRecord
  has_many :signups
  belongs_to :game
end
