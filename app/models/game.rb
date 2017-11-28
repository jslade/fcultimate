# frozen_string_literal: true

class Game < ApplicationRecord
  has_many :signups
  has_many :players
  has_many :notifications

  validates_presence_of :name, length: 2..100
  validates_presence_of :brief
  validates_presence_of :location
  validates_presence_of :game_time

  validates_format_of :email_time,
                      with: /\A\d{2}:\d{2}\z/o,
                      allow_blank: true, allow_nil: true
  validates_format_of :early_email_time,
                      with: /\A\d{2}:\d{2}\z/o,
                      allow_blank: true, allow_nil: true

  NOT_GAME_DAY = 0
  NOBODY = 1
  TOO_FEW = 2
  ENOUGH = 3
  EXTRA = 4
  validates_inclusion_of :status, in: NOT_GAME_DAY..EXTRA

  MAX_TEAM_SIZE = 10

  def on?
    [ENOUGH, EXTRA].include? status
  end

  def need_more?
    status == TOO_FEW
  end

  def game_day?(time = Time.zone.now)
    gameday.game_day?(time)
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
