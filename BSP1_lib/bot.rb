require_relative 'grid'

class Bot
  attr_reader :x,
              :y,
              :princess_x,
              :princess_y

  def initialize(grid)
    @x = grid.bot_r
    @y = grid.bot_c
    @princess_x = grid.princess.first
    @princess_y = grid.princess.last
  end
end
