module Api
  class GameSerializer < ActiveModel::Serializer
    attributes \
      :id,
      :name,
      :brief,
      :description,
      :location
  end
end
