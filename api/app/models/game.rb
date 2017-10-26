class Game < ApplicationRecord
  has_many :signups
  has_many :players

  validates_presence_of :name, :length => 2..100
  validates_presence_of :brief
  validates_presence_of :location
  validates_presence_of :game_time

  validates_format_of :email_time,
    :with => /\A\d{2}:\d{2}\z/o,
    :allow_blank => true, :allow_nil => true
  validates_format_of :early_email_time,
    :with => /\A\d{2}:\d{2}\z/o,
    :allow_blank => true, :allow_nil => true

  NOT_GAME_DAY = 0.freeze
  NOBODY = 1.freeze
  TOO_FEW = 2.freeze
  ENOUGH = 3.freeze
  EXTRA = 4.freeze
  validates_inclusion_of :status, :in => NOT_GAME_DAY .. EXTRA

  MAX_TEAM_SIZE = 10.freeze

  def is_game_day?(time=Time.zone.now)
    gameday.is_game_day?(time)
  end

  def gameday
    @gameday ||= ::Gameday.new(days: game_days)
  end

  def sorted_signups
    signups.sort_by do |s|
      [s.team_size, s.player.name.downcase]
    end
  end
end
