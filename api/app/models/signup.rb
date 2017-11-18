class Signup < ApplicationRecord
  belongs_to :game
  belongs_to :player

  validates_presence_of :game_id
  validates_presence_of :player_id
  validates_inclusion_of :team_size, in: 0..Game::MAX_TEAM_SIZE

  def willing_to_play?(team_size)
    self.team_size <= team_size
  end

  def team_size_label
    if team_size > 0
      "#{team_size} v #{team_size}"
    else
      "any"
    end
  end
end
