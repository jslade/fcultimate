RSpec.describe SignupManager, type: :service do
  let(:game) { create :game }
  let(:mgr) { SignupManager.new(game) }

  describe 'signups' do
    before { mgr.update_status }

    context 'nobody signed up' do
      it { expect(game.status).to eq Game::NOBODY }
    end

    context 'adding a player' do
      it 'creates a signup and updates status' do
        expect { @su = mgr.add_player 'joe', 4 }.to change { game.signups.size }.by 1
        expect(@su.player.name).to eq 'joe'
        expect(game.status).to eq Game::TOO_FEW
      end
    end

    context 'adding a mix of players' do
      it 'matches on exact number' do
        6.times { |p| mgr.add_player "p3-#{p}", 3 }
        2.times { |p| mgr.add_player "p4-#{p}", 4 }
        expect(game.status).to eq Game::ENOUGH
      end

      it 'notices extras' do
        3.times { |p| mgr.add_player "p3-#{p}", 3 }
        4.times { |p| mgr.add_player "p4-#{p}", 4 }
        10.times { |p| mgr.add_player "p5-#{p}", 5 }
        expect(game.status).to eq Game::EXTRA
      end
    end
  end
end
