require 'curses'
require_relative 'cell.rb'

include Curses

class Display
  def initialize(grid)
    Curses.init_screen
    Curses.start_color
    Curses.init_pair(COLOR_RED,COLOR_RED,COLOR_RED)
    Curses.init_pair(COLOR_WHITE,COLOR_WHITE,COLOR_WHITE)
    top, left = (Curses.lines - grid.rows) / 2, (Curses.cols - grid.columns) / 2
    @bwin = Curses::Window.new(grid.rows, grid.columns, top, left)
  end

  def draw(grid)
    grid.content.each_with_index do |row, x|
      row.each_with_index do |cell, y|
        @bwin.setpos(x, y)
        shade(cell)
      end
    end
    @bwin.refresh
    sleep(1)
  end

  def shade(cell)
    if cell.state == Cell::DEAD
      return with_color(cell, COLOR_RED)
    end

    with_color(cell, COLOR_WHITE)
  end

  def with_color(cell, color)
    @bwin.attron(color_pair(color)|color){
      @bwin.addstr(cell.state)
    }
  end

  def close
    @bwin.close
  end
end
