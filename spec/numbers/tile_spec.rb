require 'numbers/tile'

describe Numbers::Tile do

  let(:tile) { described_class.new(0, 0) }

  describe 'initialize' do
    it 'initializes all of the values' do
      expect(tile.x).to eq(0)
      expect(tile.y).to eq(0)
      expect(tile.value).to eq(2)
    end

    it 'overrides the value' do
      tile = Numbers::Tile.new(0, 0, 4)
      expect(tile.value).to eq(4)
    end
  end

  describe '#can_merge?' do
    it 'cannot merge if any check fails' do
      allow_any_instance_of(Numbers::Tile::NumericalSimilarityCheck).to receive(:valid?).and_return(false)
      allow_any_instance_of(Numbers::Tile::AdjacencyCheck).to receive(:valid?).and_return(false)
      expect(tile.can_merge?(tile)).to be false
    end

    it 'cannot merge unless all checks pass' do
      allow_any_instance_of(Numbers::Tile::NumericalSimilarityCheck).to receive(:valid?).and_return(true)
      allow_any_instance_of(Numbers::Tile::AdjacencyCheck).to receive(:valid?).and_return(true)
      expect(tile.can_merge?(tile)).to be true
    end
  end

  describe '#merge' do
    let(:tile2) { Numbers::Tile.new(0, 1, 2) }

    it 'fails to merge if it does not pass the checks' do
      expect(tile).to receive(:can_merge?).and_return(false)
      expect{ tile.merge(tile) }.to raise_error(Numbers::Tile::InvalidMergeError)
    end

    it 'merges the values into the current tile' do
      expect(tile.value).to eq(2)
      tile.merge(tile2)
      expect(tile.value).to eq(4)
    end
  end

  describe '#move' do
    it 'moves a tile along an axis' do
      tile.move(0, 3)
      expect(tile.x).to eq(0)
      expect(tile.y).to eq(3)
    end
  end
end
