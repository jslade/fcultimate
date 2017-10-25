RSpec.describe Gameday, type: :model do
  describe 'is_game_day?' do
    let(:gameday) { Gameday.new(days: 'Mon Thu')}

    it do
      expect(gameday.is_game_day?(Time.new(2017,10,19))).to be_truthy
      expect(gameday.is_game_day?(Time.new(2017,10,21))).to be_falsey
      expect(gameday.is_game_day?(Time.new(2017,10,23))).to be_truthy
    end
  end
end
