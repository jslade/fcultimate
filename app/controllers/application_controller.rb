class ApplicationController < ActionController::Base
  self.responder = ApplicationResponder
  respond_to :html

  protect_from_forgery with: :exception

  # For any urls that don't match explicitly-configured routes, fallback
  # to serving the root index.html, which will mean that url is handled
  # by react-router on the frontend
  def fallback
    render file: 'public/index.html'
  end
end
