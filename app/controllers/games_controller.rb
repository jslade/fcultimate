# frozen_string_literal: true

class GamesController < ApiController
  def index
    scope = Game.all
    respond_with scope, each_serializer: Api::GameSerializer
  end

  def show
    game = if params[:id] =~ /\A\d+\z/
             Game.find(params[:id])
           else
             Game.find_by(name: params[:id])
           end

    respond_with game, serializer: Api::GameSerializer
  end
end
