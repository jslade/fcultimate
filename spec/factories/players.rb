# frozen_string_literal: true

FactoryBot.define do
  factory :player do
    sequence(:name) { |n| "P#{n}" }
  end
end
