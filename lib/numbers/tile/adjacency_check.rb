module Numbers
  class Tile
    class AdjacencyCheck

      attr_reader :tile1, :tile2

      def initialize(tile1, tile2)
        @tile1 = tile1
        @tile2 = tile2
      end

      def valid?
        same_x? || same_y?
      end

      private

      def same_x?
        tile1.x == tile2.x
      end

      def same_y?
        tile1.y == tile2.y
      end
    end
  end
end
