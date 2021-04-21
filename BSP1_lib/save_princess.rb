require_relative 'bot'
require_relative 'grid'

class SavePrincess
  attr_accessor :grid,
                :bot_column,
                :bot_row,
                :princess_column,
                :princess_row
  attr_reader   :grid, :bot

  def initialize(grid_size, grid)
    @grid = Grid.new(grid_size, grid)
    @bot = Bot.new(@grid)
    @bot_column = bot.y
    @bot_row = bot.x
    @princess_column = bot.princess_y
    @princess_row = bot.princess_x
  end

  def path_to_princess
    moves_to_princess = []
    moves_to_princess << vertical_movement until @bot_row == @princess_row
    moves_to_princess << horizontal_movement until @bot_column == @princess_column
    moves_to_princess
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
    if @bot_row > @princess_row
      @bot_row -= 1
      'UP'
    elsif @bot_row < @princess_row
      @bot_row += 1
      'DOWN'
    end
  end
end
