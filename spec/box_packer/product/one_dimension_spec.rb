# frozen_string_literal: true

RSpec.describe BoxPacker::Product::OneDimension do
  subject { described_class.new(location: { x: 1 }, dimensions: { x: 4 }) }

  describe '#location' do
    let(:result) { subject.location }

    it 'has the correct value' do
      expect(result).to include(x: 1)
    end
  end

  describe '#dimensions' do
    let(:result) { subject.dimensions }

    it 'has the correct value' do
      expect(result).to include(x: 4)
    end
  end

  describe '#inside_box?' do
    let(:result) { subject.inside_box?(box) }

    context 'when box larger than product' do
      let(:box) { BoxPacker::Box::OneDimension.new(location: { x: 0 }, dimensions: { x: 5 }) }

      it { expect(result).to eq(true) }
    end

    context 'when box is same size as product' do
      let(:box) { BoxPacker::Box::OneDimension.new(location: { x: 1 }, dimensions: { x: 4 }) }

      it { expect(result).to eq(true) }
    end

    context 'when box is shorter than product' do
      let(:box) { BoxPacker::Box::OneDimension.new(location: { x: 1 }, dimensions: { x: 3 }) }

      it { expect(result).to eq(false) }
    end

    context 'when origin after product' do
      let(:box) { BoxPacker::Box::OneDimension.new(location: { x: 2 }, dimensions: { x: 5 }) }

      it { expect(result).to eq(false) }
    end
  end
end
