# frozen_string_literal: true

module BoxPacker
  module Algorithm
    class Individual
      attr_reader :products, :box

      def initialize(products:, box:)
        @products = products
        @box = box
      end

      # rubocop:disable Metrics/AbcSize
      def mate_with(individual)
        # TODO: this will need some work to make it work with multiple dimensions
        # location/dimensions should probably be abstracted to some kind of Point class
        # That would allow the dimension to be abstracted out of the Product/Box classes

        new_products = products.zip(individual.products).map do |product1, product2|
          location1 = product1.location[:x]
          location2 = product2.location[:x]
          BoxPacker::Product::OneDimension.new(
            location: { x: location1 + Random.rand(location2 - location1 + 1) },
            dimensions: product1.dimensions
          )
        end
        new_box = Random.rand(2) == 1 ? box : individual.box

        Individual.new(products: new_products, box: new_box)
      end
      # rubocop:enable Metrics/AbcSize
    end
  end
end
