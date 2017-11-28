# frozen_string_literal: true

FactoryBot.define do
  factory :content do
    name 'Foo'
    body <<-BODY
    =The Header=

    Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod
    empor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam
    quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.
    BODY

    class_name 'foo'
  end
end
