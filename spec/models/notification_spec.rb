# frozen_string_literal: true

RSpec.describe Notification, type: :model do
  describe 'attributes' do
    its(:attributes) { should include 'what' }
    its(:attributes) { should include 'game_id' }
    its(:attributes) { should include 'sent_at' }
  end
end
