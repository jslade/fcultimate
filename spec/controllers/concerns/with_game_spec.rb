RSpec.describe Concerns::WithGame do
  let(:game) { create :game }

  controller(ApplicationController) do
    include Concerns::WithGame

    def index
      render json: { name: game.name, timezone: Time.zone.name }
    end
  end

  before :each { get :index, params: { game_id: game.id } }

  context 'with a game_id' do
    it 'sets the current game' do
      expect(json['name']).to eq game.name
    end

    it 'sets the time zone' do
      expect(json['timezone']).to eq game.timezone
    end
  end

  context 'with a id' do
    it 'sets the current game' do
      expect(json['name']).to eq game.name
    end
  end

  context 'with a game_id and id' do
    it 'sets the current game' do
      expect(json['name']).to eq game.name
    end
  end
end
