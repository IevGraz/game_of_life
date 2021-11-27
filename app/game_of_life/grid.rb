require_relative 'cell.rb'

class Grid

  attr_reader :rows, :columns, :content

  def initialize(dimension)
    @rows = dimension
    @columns = dimension
    @content = Array.new(rows){Array.new(columns){ Cell.new }}
  end

  def seed
    seed_coordinates.each do |x, y|
      @content[x][y].dead
    end
  end

  def next_generation
    @content.each_with_index do |row, x|
      row.each_with_index do |cell, y|
        neighbours = retrieve_neighbours(x, y)
        cell.move_to_next_generation(neighbours)
      end
    end
  end

  private

  def seed_coordinates
    cell_total = @rows * @columns
    dead_cell_percentage = rand(1..100)
    dead_cell_count = cell_total * dead_cell_percentage / 100
    x_coordinates = (0..@rows-1).to_a.sort{ rand() - 0.5 }[0..dead_cell_count]
    y_coordinates = (0..@columns-1).to_a.sort{ rand() - 0.5 }[0..dead_cell_count]

     x_coordinates.zip(y_coordinates)
  end

  def retrieve_neighbours(x, y)
    x_coordinates = [x-1, x, x + 1].select { |i| i >= 0 && i < @rows }
    y_coordinates = [y-1, y, y+1].select { |i| i >= 0 && i < @columns }
    neighbour_coordinates = x_coordinates.product(y_coordinates) - [x, y]
    neighbours = []
    neighbour_coordinates.each do |x_y|
      neighbours << @content[x_y[0]][x_y[1]]
    end

    neighbours
  end
end
