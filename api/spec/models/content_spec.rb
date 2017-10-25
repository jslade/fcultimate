RSpec.describe Content, type: :model do
  describe 'attributes' do
    its(:attributes) { should include 'name' }
    its(:attributes) { should include 'body' }
    its(:attributes) { should include 'class_name' }
  end
end
