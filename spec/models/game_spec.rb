# frozen_string_literal: true

RSpec.describe Game, type: :model do
  let(:game) { create :game }

  describe 'attributes' do
    its(:attributes) { should include 'name' }
    its(:attributes) { should include 'description' }
    its(:attributes) { should include 'brief' }
  end

  it 'includes gameday methods' do
    expect(game).to respond_to(:game_day?)
  end
end
