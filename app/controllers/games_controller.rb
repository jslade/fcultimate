# frozen_string_literal: true

class GamesController < ApiController
  include Concerns::WithGame

  def index
    scope = Game.all
    respond_with scope, each_serializer: Api::GameSerializer
  end

  def show
    expires_now
    respond_with game, serializer: Api::GameSerializer
  end
end
