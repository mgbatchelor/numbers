require 'numbers/board'
require 'numbers/board/position_coordinate_translator'

describe Numbers::Board::PositionCoordinateTranslator do

  let(:translator) { described_class.new(4) }

  describe '#translate_position' do
    it 'translates to a coordinate' do
      expect(translator.translate_position(0)).to eq([0, 0])
      expect(translator.translate_position(7)).to eq([3, 1])
      expect(translator.translate_position(12)).to eq([0, 3])
      expect(translator.translate_position(15)).to eq([3, 3])
    end
  end

  describe '#translate_coordinate' do
    it 'translates to a position' do
      expect(translator.translate_coordinate(0, 0)).to eq(0)
      expect(translator.translate_coordinate(3, 1)).to eq(7)
      expect(translator.translate_coordinate(0, 3)).to eq(12)
      expect(translator.translate_coordinate(3, 3)).to eq(15)
    end
  end
end
