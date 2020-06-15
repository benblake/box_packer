# frozen_string_literal: true

module BoxPacker
  module Product
    class OneDimension
      attr_reader :location, :dimensions

      def initialize(location:, dimensions:)
        @location = location
        @dimensions = dimensions
      end
    end
  end
end
