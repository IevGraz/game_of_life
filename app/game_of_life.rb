require_relative 'game_of_life/grid.rb'
require_relative 'game_of_life/display.rb'

DIMENSION = 25
NUMBER_OF_GENERATIONS = 10


grid = Grid.new(DIMENSION)
display = Display.new(grid)

grid.seed
display.draw(grid)
(1..NUMBER_OF_GENERATIONS).each do
  grid.next_generation
  display.draw(grid)
end

display.close

