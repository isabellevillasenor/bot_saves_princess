class Grid
  attr_reader :grid,
              :bot_r,
              :bot_c,
              :princess_r,
              :princess_c

  def initialize(grid_size, row, column)
    raise ArgumentError.new('Grid Size Must Be Greater Than 1, Please Try Again') unless grid_size > 1

    @grid = Array.new(grid_size)
    create_grid(grid_size)
    @bot_r = nil
    @bot_c = nil
    place_bot(row, column)
    @princess_r = nil
    @princess_c = nil
    place_princess(@bot_r, @bot_c, grid_size)
  end

  def create_grid(grid_size)
    (0...grid_size).each do |i|
      @grid[i] = '-' * grid_size
    end
  end

  def place_bot(row, column)
    @bot_r = row
    @bot_c = column
    @grid[@bot_r][@bot_c] = 'm'
  end

  def place_princess(bot_r, bot_c, grid_size)
    @princess_r = rand(0...(grid_size - 1))
    @princess_c = rand(0...(grid_size - 1))
    if [@princess_r, @princess_c] != [bot_r, bot_c]
      @grid[@princess_r][@princess_c] = 'p'
    else
      place_princess(bot_r, bot_c, grid_size)
    end
  end
end

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


def nextMove(n,r,c,grid)
  save_princess = SavePrincess.new(n, r, c)
  save_princess.next_move
end

n = gets.to_i

r,c = gets.strip.split.map {|num| num.to_i}

grid = Array.new(n)

(0...n).each do |i|
    grid[i] = gets
end

nextMove(n,r,c,grid)