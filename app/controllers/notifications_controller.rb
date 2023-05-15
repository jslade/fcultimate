class NotificationsController < ApiController
  skip_before_action :verify_authenticity_token

  before_action :verify_key

  def send_next
    Game.order(:id).each do |game|
      update_and_send(game)
    end
  end

  private

  # TODO: move this to a concern
  def verify_key
    #trace "verify_key with #{request.headers.fetch('Authorization', 'NONE')} == #{ENV.fetch('API_KEY', 'NONE')}"
    unless request.headers['Authorization'] == ENV['API_KEY']
      render json: { error: 'Unauthorized' }, status: :unauthorized
    end
  end

  def update_and_send(game)
    SignupManager.new(game).update_status
    NotificationManager.new(game).send_next_notification
  end
end
