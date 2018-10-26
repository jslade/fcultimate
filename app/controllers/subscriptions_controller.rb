# frozen_string_literal: true

class SubscriptionsController < ApiController
  include Concerns::WithGame

  protect_from_forgery except: %i[create]

  def create
    params[:unsubscribe] ? unsubscribe : subscribe
  end

  private

  def subscribe
    SubscriptionManager.new(game).subscribe(email: params[:email], name: params[:name])
  end

  def unsubscribe
    SubscriptionManager.new(game).unsubscribe(email: params[:email])
  end
end
