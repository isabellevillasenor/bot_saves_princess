require 'rspec'
require 'pry'
require_relative '../lib/grid.rb'

describe Grid do
  it 'should instantiate with correct grid size' do
    grid = Grid.new(15)

    expect(grid.grid.size).to eq(15)
  end
end
