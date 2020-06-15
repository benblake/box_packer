# frozen_string_literal: true

module BoxPacker
  module Product
    class OneDimension
      attr_reader :location, :dimensions

      def initialize(location:, dimensions:)
        @location = location
        @dimensions = dimensions
      end

      def inside_box?(box)
        box.location[:x] <= location[:x] &&
          (box.location[:x] + box.dimensions[:x] >= location[:x] + dimensions[:x])
      end
    end
  end
end
