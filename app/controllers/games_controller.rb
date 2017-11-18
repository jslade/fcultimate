class GamesController < ApiController
  def index
    scope = Game.all
    respond_with scope, each_serializer: Api::GameSerializer
  end

  def show
    if params[:id] =~ /\A\d+\z/
      game = Game.find(params[:id])
    else
      game = Game.find_by(name: params[:id])
    end

    respond_with game, serializer: Api::GameSerializer
  end
end
