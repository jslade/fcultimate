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
        status: game.status
      )
    end
  end
end
