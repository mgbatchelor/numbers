require 'numbers/tile'

describe Numbers::Board do

  let(:board) { described_class.new }

  describe 'initialize' do
    it 'initializes default values' do
      board_size = Numbers::Board::BOARD_SIZE * Numbers::Board::BOARD_SIZE
      expect(board.tiles.count).to eq(board_size)
    end

    it 'seeds the default tiles' do
      seeded_tiles = board.tiles.select{|tile| tile}
      expect(seeded_tiles.count).to eq(Numbers::Board::SEED_COUNT)
    end
  end

  describe 'add_next_tile' do
    it 'will add a tile to the board' do
      filled_tiles = board.tiles.select{|tile| tile}
      expect(filled_tiles.count).to eq(Numbers::Board::SEED_COUNT)
      board.add_next_tile
      filled_tiles = board.tiles.select{|tile| tile}
      expect(filled_tiles.count).to eq(Numbers::Board::SEED_COUNT + 1)
    end

    it 'will fail to add a new tile when the board is full' do
      board_size = Numbers::Board::BOARD_SIZE * Numbers::Board::BOARD_SIZE
      (board_size - Numbers::Board::SEED_COUNT).times do
        board.add_next_tile
      end
      expect{ board.add_next_tile }.to raise_error(Numbers::Board::NoTilesRemainingError)
    end
  end
end
