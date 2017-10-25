class ContentsController < ApiController
  def show
    content = Content.find_by(name: params[:name])
    respond_with content, serializer: Api::ContentSerializer
  end
end
