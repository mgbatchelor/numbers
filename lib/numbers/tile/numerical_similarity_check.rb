module Numbers
  class Tile
    class NumericalSimilarityCheck

      attr_reader :tile1, :tile2

      def initialize(tile1, tile2)
        @tile1 = tile1
        @tile2 = tile2
      end

      def valid?
        tile1.value == tile2.value
      end
    end
  end
end
