require_relative '../../app/game_of_life/cell.rb'
require 'factory_bot'

FactoryBot.define do
  factory :cell do
    initialize_with { new(Cell::LIVE) }
  end

  factory :dead_cell, class: Cell do
    initialize_with { new(Cell::DEAD) }
  end
end
