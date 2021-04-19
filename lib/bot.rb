require_relative 'grid'

class Bot < Grid
  attr_reader :x,
              :y,
              :princess_x,
              :princess_y

  def initialize(grid)
    @x = grid.grid.size / 2
    @y = grid.grid.size / 2
    @princess_x = grid.princess.first
    @princess_y = grid.princess.last
  end
end