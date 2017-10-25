RSpec.describe Api::GameSerializer do
  let(:game) { create :game }

  context 'as_json' do
    subject { described_class.new(game).as_json }
    it 'serializes the record' do
      expect(subject).to eq(
        id: game.id,
        name: game.name,
        brief: game.brief,
        description: game.description,
        location: game.location
      )
    end
  end
end
