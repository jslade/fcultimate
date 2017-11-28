# frozen_string_literal: true

RSpec.describe Player, type: :model do
  describe 'attributes' do
    its(:attributes) { should include 'name' }
  end
end
