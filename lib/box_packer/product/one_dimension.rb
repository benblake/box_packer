# frozen_string_literal: true

module BoxPacker
  module Product
    class OneDimension
      attr_reader :x

      def initialize(x)
        @x = x
      end
    end
  end
end
