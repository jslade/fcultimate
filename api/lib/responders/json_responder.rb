module Responders::JsonResponder
  protected

  def api_behavior
    raise MissingRenderer, format unless has_renderer?

    if get?
      display resource
    elsif post?
      display resource, status: :created, location: api_location
    elsif put?
      display resource, status: :ok
    else
      head :no_content
    end
  end
end
