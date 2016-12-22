require 'numbers/board'
require 'numbers/board/tile_slice_slider'
require 'numbers/tile'

describe Numbers::Board::TileSliceSlider do

  describe '#slide_left' do
    it 'slides to the left' do
      expect(slide_left(tiles([nil, nil, nil, 2]))).to eq([2, nil, nil, nil])
    end

    it 'it merges to the left' do
      expect(slide_left(tiles([2, 2, nil, nil]))).to eq([4, nil, nil, nil])
    end

    it 'slides to the left and merges' do
      expect(slide_left(tiles([nil, nil, 2, 2]))).to eq([4, nil, nil, nil])
    end

    it 'slides to the left and does not merge non matching values' do
      expect(slide_left(tiles([nil, nil, 2, 4]))).to eq([2, 4, nil, nil])
    end

    it 'does not slide or merge anything' do
      expect(slide_left(tiles([2, 4, nil, nil]))).to eq([2, 4, nil, nil])
    end

    it 'slides to the left and does not merge non matching values' do
      expect(slide_left(tiles([2, nil, nil, 2]))).to eq([4, nil, nil, nil])
    end
  end

  describe '#slide_right' do
    it 'slides to the right' do
      expect(slide_right(tiles([2, nil, nil, nil]))).to eq([nil, nil, nil, 2])
    end

    it 'slides to the right and merges' do
      expect(slide_right(tiles([2, 2, nil, nil]))).to eq([nil, nil, nil, 4])
    end
  end

  def tiles(values)
    values.each_with_index.map do |value, index|
      value ? Numbers::Tile.new(index, 0, value) : nil
    end
  end

  def slide_left(tiles)
    described_class.new(tiles).slide_left.map{|tile| tile ? tile.value : nil}
  end

  def slide_right(tiles)
    described_class.new(tiles).slide_right.map{|tile| tile ? tile.value : nil}
  end
end
