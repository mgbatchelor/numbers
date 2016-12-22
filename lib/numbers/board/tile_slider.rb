require 'numbers/board/slide_direction'
require 'numbers/board/tile_slice_slider'
require 'numbers/board/tile_slice_utils'

module Numbers
  class Board
    class TileSlider
      include TileSliceUtils

      attr_reader :board_size, :tiles

      def initialize(board_size, tiles)
        @board_size = board_size
        @tiles = tiles
      end

      def slide(direction)
        return unless valid?(direction)
        perform_slide(direction)
      end

      def valid?(direction)
        SlideDirection::ALL.include?(direction)
      end

      private

      def perform_slide(direction)
        case direction
        when SlideDirection::LEFT
          flatten_horizontal_slices(board_size,
            horizontal_slices(board_size, tiles).map do |slice|
              TileSliceSlider.new(slice).slide_left
            end
          )
        when SlideDirection::RIGHT
          flatten_horizontal_slices(board_size,
            horizontal_slices(board_size, tiles).map do |slice|
              TileSliceSlider.new(slice).slide_right
            end
          )
        when SlideDirection::UP
          flatten_vertical_slices(board_size,
            vertical_slices(board_size, tiles).map do |slice|
              TileSliceSlider.new(slice).slide_right
            end
          )
        when SlideDirection::DOWN
          flatten_vertical_slices(board_size,
            vertical_slices(board_size, tiles).map do |slice|
              TileSliceSlider.new(slice).slide_left
            end
          )
        else
          raise "cannot slide to an invalid direction #{direction}"
        end
      end
    end
  end
end
