require_relative 'grid'
class SavePrincess
  attr_reader :grid,
                :bot_row,
                :bot_column,
                :princess_row,
                :princess_column,
                :move

  def initialize(n, row, column, grid)
    @grid = Grid.new(grid)
    @bot_column = column
    @bot_row = row
    @grid.princess_coordinates
    @princess_column = @grid.princess_c
    @princess_row = @grid.princess_r
    @move = []
  end

  def next_move
    if (@bot_row == @princess_row)
      horizontal_movement
    else 
      vertical_movement
    end
    puts @move
  end

  def horizontal_movement
    if @bot_column > @princess_column
      @bot_column -= 1
      @move << 'LEFT'
    elsif @bot_column < @princess_column
      @bot_column += 1
      @move << 'RIGHT'
    end
  end

  def vertical_movement
    if @bot_column == @princess_column
      if @bot_row > @princess_row
        @bot_row -= 1
        @move << 'UP'
      elsif @bot_row < @princess_row
        @bot_row += 1
        @move << 'DOWN'
      end
    else
      if @bot_row > @princess_row
        @bot_row -= 1
        @move << 'UP'
      elsif @bot_row < @princess_row
        @bot_row += 1
        @move << 'DOWN'
      end
    end
  end
end
