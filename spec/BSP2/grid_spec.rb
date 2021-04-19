require 'spec_helper'
require_relative '../../BSP2_lib/grid'

describe Grid do
  it 'should instantiate with correct grid size' do
    grid_1 = Grid.new(3)
    grid_2 = Grid.new(99)

    expect(grid_1.grid.size).to eq(3)
    expect(grid_2.grid.size).to eq(99)
  end

  it 'should instantiate with the bot randomly placed' do
    grid_1 = Grid.new(3)

    expect(grid_1.bot_row).to be_an Integer
    expect(grid_1.bot_collumn).to be_an Integer
    expect(grid_1.grid[0].include?('m') || grid_1.grid[1].include?('m') || grid_1.grid[2].include?('m')).to be true
  end

  it 'should instantiate with the princess randomly placed' do
    grid_1 = Grid.new(3)

    expect(grid_1.princess_row).to be_an Integer
    expect(grid_1.princess_collumn).to be_an Integer
    expect(grid_1.grid[0].include?('p') || grid_1.grid[1].include?('p') || grid_1.grid[2].include?('p')).to be true
  end
end