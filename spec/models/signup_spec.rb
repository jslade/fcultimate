# frozen_string_literal: true

RSpec.describe Signup, type: :model do
  describe 'attributes' do
    its(:attributes) { should include 'team_size' }
    its(:attributes) { should include 'comment' }
  end

  describe 'willing_to_play' do
    let(:signup) { build :signup }
    it do
      expect(signup.willing_to_play?(2)).to be_falsey
      expect(signup.willing_to_play?(3)).to be_truthy
      expect(signup.willing_to_play?(4)).to be_truthy
    end
  end

  describe 'team_size_label' do
    context 'specified team size' do
      let(:signup) { build :signup }
      it { expect(signup.team_size_label).to eq '3 v 3' }
    end

    context 'unspecified team size' do
      let(:signup) { build :signup, team_size: 0 }
      it { expect(signup.team_size_label).to eq 'any' }
    end
  end
end
