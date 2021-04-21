class Grid
  attr_reader :grid, :princess, :dynamic_corner

  def initialize(grid_size)
    raise ArgumentError.new('Grid Size Must Be An Odd Number, Please Try Again') unless grid_size.odd?
    raise ArgumentError.new('Grid Size Must Be Greater Than 2, Please Try Again') unless grid_size > 2

    @dynamic_corner = grid_size - 1
    @grid = Array.new(grid_size)
    create_grid(grid_size)
    place_bot
    place_princess
    @princess = princess_coordinates.compact.flatten
  end

  def create_grid(grid_size)
    (0...grid_size).each do |i|
      @grid[i] = '-' * grid_size
    end
  end

  def place_bot
    @grid[(@dynamic_corner / 2)][(@dynamic_corner / 2)] = 'm'
  end

  def place_princess
    corner = 0, -1
    @grid[corner.sample][corner.sample] = 'p'
  end

  def princess_coordinates
    corners = [0, 0], [0, @dynamic_corner], [@dynamic_corner, 0], [@dynamic_corner, @dynamic_corner]
    corners.map do |corner|
      corner if @grid[corner[0]][corner[1]] == 'p'
    end
  end
end

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

class SavePrincess < Bot
  attr_accessor :grid,
                :x,
                :y,
                :princess_x,
                :princess_y
  attr_reader   :grid, :bot

  def initialize(grid_size)
    @grid = Grid.new(grid_size)
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
  save_princess = SavePrincess.new(n)

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
