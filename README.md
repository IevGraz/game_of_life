## Introduction

A very simple implementation of [Conway's Game of Life](https://en.wikipedia.org/wiki/Conway%27s_Game_of_Life) following the rules:
- Any live cell with fewer than two live neighbours dies, as if by underpopulation.
- Any live cell with two or three live neighbours lives on to the next generation.
- Any live cell with more than three live neighbours dies, as if by overpopulation.
- Any dead cell with exactly three live neighbours becomes a live cell, as if by reproduction.

And implemented in plain Ruby.

## Dependencies
- [Curses](https://rubygems.org/gems/curses/versions/1.2.4) to make the generations evolve on the screen 
instead of simply printing out grids one by one. 
- [Rspec](https://rubygems.org/gems/rspec) for writing BDD style tests.
- [FactoryBot](https://rubygems.org/gems/factory_bot) fixtures to make initialising data in tests more elegant 

## Running the code
__Note:__ You need to have ruby installed on your local machine.
```
ruby app/game_of_life.rb
```

To run the tests simply write `rspec` in the root folder.
