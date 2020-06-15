# frozen_string_literal: true

RSpec.describe BoxPacker::Product::OneDimension do
  subject { described_class.new(5) }

  describe '#x' do
    let(:result) { subject.x }

    it 'has the correct value' do
      expect(result).to eq(5)
    end
  end
end
