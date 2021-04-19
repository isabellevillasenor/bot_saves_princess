require_relative 'grid'

class SavePrincess
  attr_accessor :grid,
                :bot_row,
                :bot_column,
                :princess_row,
                :princess_column

  def initialize(grid_size)
    @grid = Grid.new(grid_size)
    @bot_column = @grid.bot_column
    @bot_row = @grid.bot_row
    @princess_column = @grid.princess_column
    @princess_row = @grid.princess_row
  end

  def next_move
    move = nil
    if (@bot_row == @princess_row)
      move = horizontal_movement
    else 
      move = vertical_movement
    end
    move
    # binding.pry
  end

  def horizontal_movement
    if @bot_row == @princess_row
      if @bot_column > @princess_column
        @bot_row -= 1
        'RIGHT'
      elsif @bot_column < @princess_column
        @bot_row += 1
        'LEFT'
      end
    end
    if @bot_row > @princess_row
      @bot_row -= 1
      'LEFT'
    elsif @bot_row < @princess_row
      @bot_row += 1
      'RIGHT'
    end
  end

  def vertical_movement
    if @bot_column == @princess_column
      if @bot_row > @princess_row
        @bot_column -= 1
        'DOWN'
      elsif @bot_row < @princess_row
        @bot_column += 1
        'UP'
      end
    end
    if @bot_column > @princess_column
      @bot_column -= 1
      'UP'
    elsif @bot_column < @princess_column
      @bot_column += 1
      'DOWN'
    end
  end
end
