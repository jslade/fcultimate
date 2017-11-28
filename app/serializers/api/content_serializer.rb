# frozen_string_literal: true

module Api
  class ContentSerializer < ActiveModel::Serializer
    attributes \
      :id,
      :name,
      :body,
      :class_name
  end
end
