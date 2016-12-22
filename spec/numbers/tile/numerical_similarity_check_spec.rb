require 'numbers/tile'
require 'numbers/tile/numerical_similarity_check'

describe Numbers::Tile::NumericalSimilarityCheck do

  let(:tile1) { Numbers::Tile.new(0, 0) }

  describe "#valid?" do
    it 'fails if the values are different' do
      tile2 = Numbers::Tile.new(0, 0, 4)
      expect(check(tile2)).to be false
    end

    it 'succeeds if the tile values are the same' do
      tile2 = Numbers::Tile.new(0, 0)
      expect(check(tile2)).to be true
    end
  end

  def check(tile2)
    described_class.new(tile1, tile2).valid? && described_class.new(tile2, tile1).valid?
  end
end
