require 'spec_helper'
require_relative '../../grid'

describe Grid do
  it 'should instantiate with correct grid size' do
    grid_1 = Grid.new(["-----\n", "-----\n", "p--m-\n", "-----\n", "-----\n"])

    expect(grid_1.grid.size).to eq(5)
  end

  it 'should instantiate with the princess randomly placed' do
    grid_1 = Grid.new(["-----\n", "-----\n", "p--m-\n", "-----\n", "-----\n"])

    grid_1.princess_coordinates
    expect(grid_1.princess_r).to eq(2)
    expect(grid_1.princess_c).to eq(0)
  end
end
