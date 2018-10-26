# frozen_string_literal: true

module Concerns
  module WithGame
    extend ActiveSupport::Concern
    include Traceable

    included do
      around_action :with_timezone
    end

    def game
      @game ||= find_game(params[:game_id] || params[:id])
    end

    private

    def find_game(id)
      trace "#{self.class.name} find_game id=#{id}"
      return Game.find(id) if id =~ /\A\d+\z/
      Game.find_by(name: id)
    end

    def with_timezone(&block)
      Time.use_zone(game&.timezone, &block)
    end
  end
end
