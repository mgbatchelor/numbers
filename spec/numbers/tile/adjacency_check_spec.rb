require 'numbers/tile'
require 'numbers/tile/adjacency_check'

describe Numbers::Tile::AdjacencyCheck do

  let(:tile1) { Numbers::Tile.new(0, 0) }

  describe "#valid?" do
    it 'succeeds if the tiles are next to each other' do
      tile2 = Numbers::Tile.new(1, 0)
      expect(check(tile2)).to be true
    end

    it 'succeeds if the tiles are above each other' do
      tile2 = Numbers::Tile.new(0, 1)
      expect(check(tile2)).to be true
    end
  end

  def check(tile2)
    described_class.new(tile1, tile2).valid? && described_class.new(tile2, tile1).valid?
  end
end
