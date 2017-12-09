# frozen_string_literal: true

class SignupsController < ApiController
  include Concerns::WithGame

  protect_from_forgery except: %i[create update]

  def create
    mgr = SignupManager.new(game)

    mgr.add_player(
      params[:name],
      params[:team_size],
      comment: params[:comment]
    )

    respond_with game, serializer: Api::GameSerializer
  end

  def update
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
