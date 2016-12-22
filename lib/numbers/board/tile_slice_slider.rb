module Numbers
  class Board
    class TileSliceSlider

      attr_reader :slice

      def initialize(slice)
        @slice = slice
      end

      def slide_left
        slide(slice)
      end

      def slide_right
        slide(slice.reverse).reverse
      end

      private

      def slide(slice)
        new_slice = slice.reject{|tile| tile.nil?}
        new_slice = new_slice.size.times.map do |index|
          current_tile = new_slice[index]
          next_tile = new_slice[index + 1]
          if current_tile && next_tile && current_tile.can_merge?(next_tile)
            current_tile.merge(next_tile)
            new_slice[index + 1] = nil
          end
          current_tile
        end.select{|tile| tile}

        new_slice.fill(nil, new_slice.size...slice.size)
      end

    end
  end
end
