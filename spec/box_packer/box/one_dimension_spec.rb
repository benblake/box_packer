# frozen_string_literal: true

RSpec.describe BoxPacker::Box::OneDimension do
  subject { described_class.new(location: { x: 1 }, dimensions: { x: 2 }) }

  describe '#location' do
    let(:result) { subject.location }

    it 'has the correct value' do
      expect(result).to include(x: 1)
    end
  end

  describe '#dimensions' do
    let(:result) { subject.dimensions }

    it 'has the correct value' do
      expect(result).to include(x: 2)
    end
  end

  describe '#limits' do
    let(:result) { subject.limits }

    it 'has the correct values' do
      expect(result).to include(x0: 1)
      expect(result).to include(x1: 3)
    end
  end
end
