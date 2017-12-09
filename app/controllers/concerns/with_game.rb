# frozen_string_literal: true

module Concerns
  module WithGame
    extend ActiveSupport::Concern

    included do
      around_action :with_timezone
    end

    def game
      @_game ||= find_game(params[:game_id] || params[:id])
    end

    def find_game(id)
      if id =~ /\A\d+\z/
        Game.find(id)
      else
        Game.find_by(name: id)
      end
    end

    def with_timezone(&block)
      Time.use_zone(game&.timezone, &block)
    end
  end
end
