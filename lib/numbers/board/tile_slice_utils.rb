module Numbers
  class Board
    module TileSliceUtils

      def empty_indexes(slice)
        slice.each_with_index.map{ |position, index| !position ? index : nil }.compact
      end

      def present_indexes(slice)
        slice.each_with_index.map{ |position, index| position ? index : nil }.compact
      end

      def horizontal_slices(board_size, positions)
        board_size.times.map do |i|
          board_size.times.map do |j|
            positions[(board_size * i) + j]
          end
        end
      end

      def flatten_horizontal_slices(board_size, slices)
        slices.flatten
      end

      def vertical_slices(board_size, positions)
        board_size.times.map do |i|
          board_size.times.map do |j|
            positions[i + (board_size * j)]
          end
        end
      end

      def flatten_vertical_slices(board_size, slices)
        positions = []
        board_size.times do
          slices.each do |slice|
            positions << slice.shift
          end
        end
        positions
      end

    end
  end
end
