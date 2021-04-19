require_relative 'grid'

class Bot < Grid
  attr_accessor :bot_row,
                :bot_column,
                :princess_row,
                :princess_column

  def initialize(grid)
    @bot_row = grid.bot_r
    @bot_column = grid.bot_c
    @princess_row = grid.princess_r
    @princess_column = grid.princess_c
  end
end
