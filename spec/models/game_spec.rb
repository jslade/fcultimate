RSpec.describe Game, type: :model do
  let(:game) { create :game }

  describe 'attributes' do
    its(:attributes) { should include 'name' }
    its(:attributes) { should include 'description' }
    its(:attributes) { should include 'brief' }
  end
end
