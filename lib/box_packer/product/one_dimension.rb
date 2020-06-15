# frozen_string_literal: true

module BoxPacker
  module Product
    class OneDimension
      attr_reader :location, :dimensions

      def initialize(location:, dimensions:)
        @location = location
        @dimensions = dimensions
      end

      def limits
        @limits ||= {
          x0: location[:x],
          x1: location[:x] + dimensions[:x]
        }
      end

      def inside_box?(box)
        box.limits[:x0] <= limits[:x0] && box.limits[:x1] >= limits[:x1]
      end

      def intersects_product?(product)
        product.limits[:x1] > limits[:x0] && product.limits[:x0] < limits[:x1]
      end
    end
  end
end
