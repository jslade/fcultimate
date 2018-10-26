# frozen_string_literal: true

class SignupsController < ApiController
  include Concerns::WithGame

  protect_from_forgery except: %i[create update]

  def create
    create_or_update
  end

  def update
    create_or_update
  end

  def destroy
    mgr = SignupManager.new(game)

    signup = Signup.find(params[:id])
    mgr.remove_player(signup)

    respond_with game, serializer: Api::GameSerializer
  end

  private

  def create_or_update
    mgr = SignupManager.new(game)

    mgr.add_player(
      params[:name],
      params[:team_size],
      comment: params[:comment]
    )

    respond_with game, serializer: Api::GameSerializer
  end
end
