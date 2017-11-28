# frozen_string_literal: true

module GameHelper
  def game_url(game, action = nil)
    # TODO: better url generation (using supported methods...)
    # The problem is we can't actually use the router's helper methods,
    # as the game doesn't have routes. The url must correspond to the
    # routes recognized by the React router frontend
    base_url = "http://#{ENV['MAILER_HOST']}"
    "#{base_url}/#{game.name}" + (action ? "/#{action}" : '')
  end

  def players(game)
    num = game.signups.size
    "#{num} player#{num == 1 ? '' : 's'}"
  end
end
