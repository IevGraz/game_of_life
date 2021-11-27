require_relative '../../app/game_of_life/grid.rb'
require 'factory_bot'

FactoryBot.define do
  factory :grid do
    dimension = 2

    initialize_with { new(dimension) }
  end
end

