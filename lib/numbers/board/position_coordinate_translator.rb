module Numbers
  class Board
    class PositionCoordinateTranslator

      attr_reader :board_size

      def initialize(board_size)
        @board_size = board_size
      end

      def translate_position(position)
        [position % board_size, position / board_size]
      end

      def translate_coordinate(x, y)
        x + (y * board_size)
      end
    end
  end
end
