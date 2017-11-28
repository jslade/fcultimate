# frozen_string_literal: true

RSpec.describe Gameday, type: :model do
  describe 'game_day?' do
    let(:gameday) { Gameday.new(days: 'Mon Thu') }

    it do
      expect(gameday.game_day?(Time.new(2017, 10, 19))).to be_truthy
      expect(gameday.game_day?(Time.new(2017, 10, 21))).to be_falsey
      expect(gameday.game_day?(Time.new(2017, 10, 23))).to be_truthy
    end
  end
end
