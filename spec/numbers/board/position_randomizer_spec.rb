require 'numbers/board'
require 'numbers/board/position_randomizer'

describe Numbers::Board::PositionRandomizer do

  describe '#next_random_available_position' do
    it 'chooses one of two positions' do
      randomizer = described_class.new([false, true, false, true, false])
      random_position = randomizer.next_random_available_position
      expect([0, 2, 4]).to include(random_position)
    end

    it 'returns nil if nothing is available' do
      described_class.new([true, true, true, true, true])
    end
  end

end
