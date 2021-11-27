require_relative '../../app/game_of_life/cell.rb'
require 'factory_bot'

describe Cell do
  describe '#dead' do
    subject { cell.dead }

    let(:cell) { build(:cell) }

    it 'changes cell state to dead' do
      subject
      expect(cell.state).to eq(Cell::DEAD)
    end
  end

  describe '#move_to_next_generation' do
    subject { cell.move_to_next_generation(neighbours) }

    let(:cell) { build(:cell) }
    let(:neighbours) { dead_cells + live_cells }
    let(:dead_cells) { build_list(:dead_cell, 2) }
    let(:live_cells) { build_list(:cell, 1) }

    it 'dies by underpopulation' do
      subject
      expect(cell.state).to eq(Cell::DEAD)
    end

    context 'with two live neighbours' do
      let(:live_cells) { build_list(:cell, 2) }

      it 'lives on' do
        subject
        expect(cell.state).to eq(Cell::LIVE)
      end
    end

    context 'with three live neighbours' do
      let(:live_cells) { build_list(:cell, 3) }

      it 'lives on' do
        subject
        expect(cell.state).to eq(Cell::LIVE)
      end
    end

    context 'with four live neighbours' do
      let(:live_cells) { build_list(:cell, 4) }

      it 'dies by overpopulation' do
        subject
        expect(cell.state).to eq(Cell::DEAD)
      end
    end

    context 'with dead cell' do
      let(:cell) { build(:dead_cell) }

      it 'stays dead' do
        subject
        expect(cell.state).to eq(Cell::DEAD)
      end

      context 'with exactly 3 live neighbours' do
        let(:live_cells) { build_list(:cell, 3) }

        it 'resurrects' do
          subject
          expect(cell.state).to eq(Cell::LIVE)
        end
      end
    end
  end
end
