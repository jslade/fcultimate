# frozen_string_literal: true

ActiveAdmin.register Content do
  permit_params \
    :body,
    :class_name,
    :name
end
