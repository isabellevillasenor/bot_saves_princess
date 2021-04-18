require 'spec_helper'
require '../lib/grid'

describe Grid do
  it 'should instantiate with correct grid size' do
    grid_1 = Grid.new(3)
    grid_2 = Grid.new(99)

    expect(grid_1.grid.size).to eq(3)
    expect(grid_2.grid.size).to eq(99)
  end

  it 'should error when trying to instantiate with an even number of grid cells' do
    expect{ Grid.new(4) }.to raise_error(ArgumentError)
    expect{ Grid.new(1) }.to raise_error(ArgumentError)
  end

  it 'should instantiate with the bot directly in the middle' do
    grid_1 = Grid.new(3)
    grid_2 = Grid.new(99)

    expect(grid_1.grid[1.5][1.5]).to eq('m')
    expect(grid_2.grid[49.5][49.5]).to eq('m')
  end

  it 'should instantiate with the princess in a corner' do
    grid_1 = Grid.new(3)
    grid_2 = Grid.new(99)

    expect(grid_1.grid[0].include?('p') || grid_1.grid[2].include?('p')).to be true
    expect(grid_1.grid[1].include?('p')).to be false
    expect(grid_2.grid[0].include?('p') || grid_1.grid[98].include?('p')).to be true
    expect(grid_2.grid[1...97].include?('p')).to be false
  end

  it 'should store the princesses coordinates after placement' do
    grid_1 = Grid.new(3)
    grid_2 = Grid.new(99)

    expect(grid_1.princess).to be_an Array
    expect(grid_2.princess).to be_an Array
  end
end
