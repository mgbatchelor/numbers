require 'numbers/tile/adjacency_check'
require 'numbers/tile/tile_move_check'
require 'numbers/tile/numerical_similarity_check'

module Numbers
  class Tile

    class InvalidMergeError < StandardError; end
    class InvalidMoveError < StandardError; end

    attr_reader :x, :y, :value

    def initialize(x, y, value = random_value)
      @x = x
      @y = y
      @value = value
    end

    def can_merge?(tile)
      NumericalSimilarityCheck.new(self, tile).valid? && AdjacencyCheck.new(self, tile).valid?
    end

    def merge(tile)
      raise InvalidMergeError unless can_merge?(tile)
      @value += tile.value
    end

    def can_move_to?(x, y)
      TileMoveCheck.new(self, x, y).valid?
    end

    def move(x, y)
      raise InvalidMoveError unless can_move_to?(x, y)
      @x = x
      @y = y
    end

    private

    def random_value
      rand > 0.9 ? 4 : 2
    end

  end
end
