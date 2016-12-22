require 'numbers/tile'
require 'numbers/tile/tile_move_check'

describe Numbers::Tile::TileMoveCheck do

  let(:tile) { Numbers::Tile.new(0, 0) }

  describe "#valid?" do
    it 'fails if on different row and column' do
      expect(check(4, 4)).to be false
    end

    it 'succeeds if on the same row' do
      expect(check(0, 4)).to be true
    end

    it 'succeeds if on the same column' do
      expect(check(4, 0)).to be true
    end
  end

  def check(x, y)
    described_class.new(tile, x, y).valid?
  end
end
