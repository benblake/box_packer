# frozen_string_literal: true

module BoxPacker
  module Box
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
    end
  end
end
