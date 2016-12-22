require 'numbers/board'
require 'numbers/board/tile_slider'

describe Numbers::Board::TileSlider do

  # For this tile slider test we will use a 3 x 3 board to make things easier
  #            y
  #  ---------
  #  | 6 7 8 | 2
  #  | 3 4 5 | 1
  #  | 0 1 2 | 0
  #  ---------
  # x  0 1 2

  let(:tiles) { Array.new(9) }
  let(:slider) { described_class.new(3, tiles) }

  describe '#valid?' do
    it 'only allows the predefined directions' do
      tiles[4] = Numbers::Tile.new(1, 1)
      expect(slider.valid?('foo')).to be false
      Numbers::Board::SlideDirection::ALL.each do |direction|
        expect(slider.valid?(direction)).to be true
      end
    end
  end

  describe '#slide' do
    it 'slides the tiles left' do
      tiles[4] = Numbers::Tile.new(1, 1)
      tiles[5] = Numbers::Tile.new(2, 1)
      new_tiles = slider.slide(Numbers::Board::SlideDirection::LEFT)
      expect(new_tiles[3].value).to eq(4)
    end
  end
end
