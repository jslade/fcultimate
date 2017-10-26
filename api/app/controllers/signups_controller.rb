class SignupsController < ApiController
  protect_from_forgery except: [:create, :update]

  def create
    game = Game.find(params[:game_id])
    mgr = SignupManager.new(game)

    mgr.add_player(
      params[:name],
      params[:team_size],
      comment: params[:comment]
    )

    respond_with game, serializer: Api::GameSerializer
  end

  def update
    game = Game.find(params[:game_id])
    mgr = SignupManager.new(game)

    signup = Signup.find(params[:id])
    mgr.remove_player(signup)

    respond_with game, serializer: Api::GameSerializer
  end

  def destroy
    game = Game.find(params[:game_id])
    mgr = SignupManager.new(game)

    signup = Signup.find(params[:id])
    mgr.remove_player(signup)

    respond_with game, serializer: Api::GameSerializer
  end
end
