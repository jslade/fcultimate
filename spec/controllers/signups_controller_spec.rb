RSpec.describe SignupsController do
  let(:game) { create :game }

  describe '#create' do
    it 'adds a signup' do
      expect { post :create, params: { game_id: game.id, name: 'foo', team_size: 3 } }
        .to(change { Signup.count }.by(1))
    end
  end

  describe '#update' do
    it 'updates a signup' do
      Timecop.freeze('10:30'.to_time) do
        @signup = SignupManager.new(game).add_player('foo', 0)
        expect { put :update, params: { game_id: game.id, id: @signup.id, name: 'foo', team_size: 3 } }
          .to_not(change { Signup.count })
        @signup.reload
        expect(@signup.team_size).to be(3)
      end
    end
  end

  describe '#destroy' do
    it 'removes a signup' do
      Timecop.freeze('10:30'.to_time) do
        @signup = SignupManager.new(game).add_player('foo', 3)
        expect { post :destroy, params: { game_id: game.id, id: @signup.id } }
          .to(change { Signup.count }.by(-1))
      end
    end
  end
end
