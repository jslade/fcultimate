class ApiController < ApplicationController
  responders :json
  respond_to :json
  layout false

  before_action :set_default_format
  before_action :verify_requested_format!

  private

  def set_default_format
    request.format = :json unless params[:format]
  end
end
