require_relative '../../app/game_of_life/grid.rb'
require_relative '../../app/game_of_life/cell.rb'
require 'factory_bot'

describe Grid do
  describe '.new' do
    subject{ Grid.new(dimension) }

    let(:dimension) { 5 }

    it 'initializes the grid and sets row, column count' do
      expect(subject.content.length).to eq(dimension)
      expect(subject.content[0].length).to eq(dimension)
      expect(subject.rows).to eq(dimension)
      expect(subject.columns).to eq(dimension)
    end
  end

  describe '#seed' do
    subject { grid.seed }

    let(:grid) { build(:grid) }

    it 'populates grid with some dead cells' do
      expect(grid.content.map{ |row, cell| cell.state }).not_to include(Cell::DEAD)
      subject
      expect(grid.content.map{ |row, cell| cell.state }).to include(Cell::DEAD)
    end
  end

  describe '#next_generation' do
    subject { grid.next_generation }

    let(:grid) { build(:grid) }
    let(:cell_double) { double }

    before {
      allow(Cell).to receive(:new).and_return(cell_double)
    }

    it 'moves the entire grid to next generation' do
      expect(cell_double).to receive(:move_to_next_generation).exactly(4).times
      subject
    end
  end
end
