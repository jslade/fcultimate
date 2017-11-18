class Gameday
  include ActiveModel::Model
  attr_accessor :game, :days

  validates_format_of :days,
    :with => /(\w+ ?)+/o,
    :allow_blank => true, :allow_nil => true

  def is_game_day?(time=Time.zone.now)
    if is_normal_game_day?(time)
      !is_non_game_exception?(time)
    else
      is_extra_game_exception?(time)
    end
  end

  private

  DAY_NAMES = %w(sun mon tue wed thu fri sat).freeze

  def is_normal_game_day?(time)
    return true unless days # No restriction on gamedays

    today = DAY_NAMES[time.wday]
    days.downcase.include? today
  end

  def is_non_game_exception?(_time)
    # For now, gameday overrides not implemented
    # TODO: Add a list of game overrides to the game record,
    # and this will pull from there
    false
  end

  def is_extra_game_exception?(_time)
    # For now, gameday overrides not implemented
    false
  end
end
