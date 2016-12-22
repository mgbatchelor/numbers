module Numbers
  class Tile
    class TileMoveCheck

      attr_reader :tile, :x, :y

      def initialize(tile, x, y)
        @tile = tile
        @x = x
        @y = y
      end

      def valid?
        same_y? || same_x?
      end

      private

      def same_x?
        tile.x == x
      end

      def same_y?
        tile.y == y
      end
    end
  end
end
