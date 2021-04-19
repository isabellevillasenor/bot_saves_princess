require 'spec_helper'
require_relative '../../BSP2_lib/grid'

describe Grid do
  it 'should instantiate with correct grid size' do
    grid_1 = Grid.new(3, 0, 0)
    grid_2 = Grid.new(99, 0, 0)

    expect(grid_1.grid.size).to eq(3)
    expect(grid_2.grid.size).to eq(99)
  end

  it 'should instantiate with the bot placed from given arguments' do
    grid_1 = Grid.new(3, 0, 0)

    expect(grid_1.bot_r).to be_zero
    expect(grid_1.bot_c).to be_zero
  end

  it 'should instantiate with the princess randomly placed' do
    grid_1 = Grid.new(3, 0, 0)

    expect(grid_1.princess_r).to be_an Integer
    expect(grid_1.princess_c).to be_an Integer
    expect(grid_1.grid[0].include?('p') || grid_1.grid[1].include?('p') || grid_1.grid[2].include?('p')).to be true
  end

  it 'should raise argument error if user tries to make board size less than 2' do
    expect{ Grid.new(1) }.to raise_error(ArgumentError)
  end
end