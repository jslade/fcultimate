# frozen_string_literal: true

FactoryBot.define do
  factory :signup do
    association :player, strategy: :build
    team_size 3
  end
end
