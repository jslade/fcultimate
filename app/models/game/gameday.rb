# frozen_string_literal: true

class Game < ApplicationRecord
  def game_day?(time = Time.zone.now)
    if normal_game_day?(time)
      !non_game_exception?(time)
    else
      extra_game_exception?(time)
    end
  end

  def normal_game_day?(time = Time.zone.now)
    today = Time::RFC2822_DAY_NAME[time.wday]
    (game_days || '') =~ /#{today}/ ? true : false
  end

  def non_game_exception?(_time = Time.zone.now)
    nil
  end

  def extra_game_exception?(_time = Time.zone.now)
    nil
  end
end
