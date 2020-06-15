# frozen_string_literal: true

RSpec.describe BoxPacker::Algorithm::Individual do
  subject do
    described_class.new(
      products: [
        BoxPacker::Product::OneDimension.new(location: { x: 0 }, dimensions: { x: 1 }),
        BoxPacker::Product::OneDimension.new(location: { x: 0 }, dimensions: { x: 2 }),
        BoxPacker::Product::OneDimension.new(location: { x: 0 }, dimensions: { x: 3 })
      ],
      box: BoxPacker::Box::OneDimension.new(location: { x: 0 }, dimensions: { x: 5 })
    )
  end

  describe '#mate_with' do
    let(:result) { subject.mate_with(individual) }
    let(:individual) do
      described_class.new(
        products: [
          BoxPacker::Product::OneDimension.new(location: { x: 1 }, dimensions: { x: 1 }),
          BoxPacker::Product::OneDimension.new(location: { x: 2 }, dimensions: { x: 2 }),
          BoxPacker::Product::OneDimension.new(location: { x: 3 }, dimensions: { x: 3 })
        ],
        box: BoxPacker::Box::OneDimension.new(location: { x: 0 }, dimensions: { x: 6 })
      )
    end

    before do
      expect(Random).to receive(:rand).with(2).and_return(0)
      expect(Random).to receive(:rand).with(3).and_return(1)
      expect(Random).to receive(:rand).with(4).and_return(3)
      expect(Random).to receive(:rand).with(2).and_return(1)
    end

    it 'creates child with correct products' do
      expect(result.products[0].location).to include(x: 0)
      expect(result.products[0].dimensions).to include(x: 1)

      expect(result.products[1].location).to include(x: 1)
      expect(result.products[1].dimensions).to include(x: 2)

      expect(result.products[2].location).to include(x: 3)
      expect(result.products[2].dimensions).to include(x: 3)
    end

    it 'creates child with correct box' do
      expect(result.box.dimensions).to include(x: 5)
    end
  end
end
