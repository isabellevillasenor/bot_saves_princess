class Grid
  attr_reader :grid,
              :bot_r,
              :bot_c,
              :princess

  def initialize(grid_size, grid)
    raise ArgumentError.new('Grid Size Must Be An Odd Number, Please Try Again') unless grid_size.odd?
    raise ArgumentError.new('Grid Size Must Be Greater Than 2, Please Try Again') unless grid_size > 2


    @grid = grid
    @grid_size = grid_size
    @bot_r = (grid_size - 1) / 2
    @bot_c = (grid_size - 1) / 2
    @princess = princess_coordinates.compact.flatten
  end

  def princess_coordinates
    corners = [0, 0], [0, (@grid_size - 1)], [(@grid_size - 1), 0], [(@grid_size - 1), (@grid_size - 1)]
    corners.map do |corner|
      corner if @grid[corner[0]][corner[1]] == 'p'
    end
  end
end

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

def displayPathtoPrincess(n,grid)
  save_princess = SavePrincess.new(n, grid)

  save_princess.path_to_princess.each do |movement|
    puts movement
  end
end

m = gets.to_i

grid = Array.new(m)

(0...m).each do |i|
    grid[i] = gets.strip
end

displayPathtoPrincess(m,grid)
