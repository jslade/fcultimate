RSpec.describe SubscriptionsController do
  let(:game) { create :game }

  describe '#create' do
    context 'subscribe' do
      it 'makes a subscription' do
        expect_any_instance_of(SubscriptionManager).to receive(:subscribe)
          .with(email: 'x@y.z', name: 'X')
        post :create, params: {
          game_id: game.id,
          subscribe: true,
          email: 'x@y.z',
          name: 'X'
        }
      end
    end

    context 'unsubscribe' do
      it 'removes a subscription' do
        expect_any_instance_of(SubscriptionManager).to receive(:unsubscribe)
          .with(email: 'x@y.z')
        post :create, params: {
          game_id: game.id,
          unsubscribe: true,
          email: 'x@y.z'
        }
      end
    end
  end
end
