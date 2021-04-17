require 'rspec'
require 'pry'
require_relative '../lib/grid'

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
end