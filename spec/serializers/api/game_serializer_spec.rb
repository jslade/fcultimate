# frozen_string_literal: true

RSpec.describe Api::GameSerializer do
  let(:game) { create :game }

  context 'as_json' do
    subject { described_class.new(game).as_json }
    it 'serializes the record' do
      expect(subject).to eq(
        brief: game.brief,
        description: game.description,
        id: game.id,
        location: game.location,
        name: game.name,
        status: game.status,
        min_team_size: game.min_team_size,
        max_team_size: game.max_team_size,
        curr_team_size: game.curr_team_size,
        signups: [],
        notify_address: game.notify_address,
        subscribe_url: game.subscribe_url,
        unsubscribe_url: game.unsubscribe_url
      )
    end
  end
end
