require 'spec_helper'
require_relative '../../grid'

describe Grid do
  it 'should instantiate with correct grid size' do
    grid_1 = Grid.new(3, ["---", "-m-", "p--"])

    expect(grid_1.grid.size).to eq(3)
  end

  it 'should error when trying to instantiate with an even number of grid cells' do
    expect{ Grid.new(4) }.to raise_error(ArgumentError)
  end

  it 'should error when trying to instantiate with number less than 3' do
    expect{ Grid.new(1) }.to raise_error(ArgumentError)
  end

  it 'should get correct bot coordinates' do
    grid_1 = Grid.new(3, ["---", "-m-", "p--"])

    expect(grid_1.bot_r).to eq(1)
    expect(grid_1.bot_c).to eq(1)
  end

  it 'should get correct princess coordinates' do
    grid_1 = Grid.new(3, ["---", "-m-", "p--"])

    expect(grid_1.princess).to eq([2, 0])
  end
end
