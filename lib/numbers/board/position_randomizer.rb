module Numbers
  class Board
    class PositionRandomizer

      attr_reader :positions

      def initialize(positions)
        @positions = empty_indexes(positions)
      end

      def next_random_available_position
        positions.shuffle.first
      end

      private

      def empty_indexes(positions)
        positions.each_with_index.map{ |position, index| !position ? index : nil }.compact
      end

    end
  end
end
