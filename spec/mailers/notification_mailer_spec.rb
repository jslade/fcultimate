RSpec.describe NotificationMailer, type: :service do
  let(:game) { create :game, name: 'spec', notify_address: 'dummy@example.com' }

  def deliver(action)
    NotificationMailer.new.send(action, game).deliver
  end

  def delivered_count
    ActionMailer::Base.deliveries.count
  end

  describe 'game_on' do
    it 'delivers an email' do
      expect { deliver(:game_on) }.to change { delivered_count }.by 1
    end
  end

  describe 'game_off' do
    it 'delivers an email' do
      expect { deliver(:game_off) }.to change { delivered_count }.by 1
    end
  end

  describe 'game_day' do
    it 'delivers an email' do
      expect { deliver(:game_day) }.to change { delivered_count }.by 1
    end
  end

  describe 'need_more' do
    it 'delivers an email' do
      expect { deliver(:need_more) }.to change { delivered_count }.by 1
    end
  end
end
