require 'numbers/tile'
require 'numbers/board/position_coordinate_translator'
require 'numbers/board/position_randomizer'
require 'numbers/board/tile_slider'

module Numbers
  class Board
    BOARD_SIZE = 3
    SEED_COUNT = 2

    attr_reader :tiles, :board_size, :score, :history

    class NoTilesRemainingError < StandardError; end

    def initialize(board_size = BOARD_SIZE, seed_count = SEED_COUNT)
      @tiles = Array.new(board_size * board_size)
      @board_size = board_size
      seed_board(seed_count)
      @history = []
      @score = 0
    end

    def add_next_tile
      random_position = next_random_available_position
      x, y = *translate_position(tiles, random_position)
      @tiles[random_position] = Numbers::Tile.new(x, y)
    end

    def slide(direction)
      new_tiles = tile_slider.slide(direction)
      if new_tiles && tile_values(new_tiles) != tile_values(tiles)
        @history << [direction, tile_values(tiles)]
        @tiles = move_tiles(new_tiles)
        @score = @history.last.last.compact.reduce(&:+)
        add_next_tile
      end
    end

    private

    def seed_board(seed_count)
      seed_count.times{ add_next_tile }
    end

    def move_tiles(tiles)
      tiles.each_with_index do |tile, index|
        tile.move(*translate_position(tiles, index)) if tile
      end
    end

    def translate_position(tiles, position)
      PositionCoordinateTranslator.new(tiles.count).translate_position(position)
    end

    def next_random_available_position
      position = PositionRandomizer.new(tiles.map{ |tile| !!tile }).next_random_available_position
      raise NoTilesRemainingError unless position
      position
    end

    def tile_slider
      Numbers::Board::TileSlider.new(board_size, tiles)
    end

    def tile_values(tiles)
      tiles.map{ |tile| tile ? tile.value : nil }
    end

  end
end
