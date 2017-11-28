# frozen_string_literal: true

RSpec.describe Api::ContentSerializer do
  let(:content) { create :content }

  context 'as_json' do
    subject { described_class.new(content).as_json }
    it 'serializes the record' do
      expect(subject).to eq(
        id: content.id,
        name: content.name,
        body: content.body,
        class_name: content.class_name
      )
    end
  end
end
