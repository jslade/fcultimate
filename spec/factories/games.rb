# frozen_string_literal: true

FactoryBot.define do
  factory :game do
    name { 'A Game' }
    brief { 'blah blah' }
    location { 'some park ' }
    game_time { '12:00' }
    min_team_size { 3 }
    timezone { 'US/Mountain' }
  end
end
