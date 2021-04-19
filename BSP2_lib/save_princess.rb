require_relative 'grid'
require_relative 'bot'

class SavePrincess < Bot
  attr_accessor :grid,
                :bot_row,
                :bot_column,
                :princess_row,
                :princess_column

  def initialize(grid_size, row, column)
    @grid = Grid.new(grid_size, row, column)
    @bot = Bot.new(@grid)
    @bot_column = @bot.bot_column
    @bot_row = @bot.bot_row
    @princess_column = @bot.princess_column
    @princess_row = @bot.princess_row
  end

  def next_move
    move = nil
    if (@bot_row == @princess_row)
      move = horizontal_movement
    else 
      move = vertical_movement
    end
    move
  end

  def horizontal_movement
    if @bot_column > @princess_column
      @bot_column -= 1
      'LEFT'
    elsif @bot_column < @princess_column
      @bot_column += 1
      'RIGHT'
    end
  end

  def vertical_movement
    if @bot_column == @princess_column
      if @bot_row > @princess_row
        @bot_row -= 1
        'UP'
      elsif @bot_row < @princess_row
        @bot_row += 1
        'DOWN'
      end
    else
      if @bot_row > @princess_row
        @bot_row -= 1
        'UP'
      elsif @bot_row < @princess_row
        @bot_row += 1
        'DOWN'
      end
    end
  end

  def princess_saved
    [@bot_row, @bot_column] == [@princess_row, @princess_column]
  end
end
