class Grid
  attr_reader :grid,
              :bot_row,
              :bot_column,
              :princess_row,
              :princess_column

  def initialize(grid_size)
    raise ArgumentError.new('Grid Size Must Be Greater Than 2, Please Try Again') unless grid_size > 2

    @grid = Array.new(grid_size)
    create_grid(grid_size)
    @bot_row = nil
    @bot_column = nil
    place_bot(grid_size)
    @princess_row = nil
    @princess_column = nil
    place_princess(@bot_row, @bot_column, grid_size)
    # @princess = princess_coordinates.compact.flatten
  end

  def create_grid(grid_size)
    (0...grid_size).each do |i|
      @grid[i] = '-' * grid_size
    end
  end

  def place_bot(grid_size)
    @bot_row = rand(0...(grid_size - 1))
    @bot_column = rand(0...(grid_size - 1))
    @grid[@bot_row][@bot_column] = 'm'
  end

  def place_princess(bot_row, bot_column, grid_size)
    @princess_row = rand(0...(grid_size - 1))
    @princess_column = rand(0...(grid_size - 1))
    if [@princess_row, @princess_column] != [bot_row, bot_column]
      @grid[@princess_row][@princess_column] = 'p'
    else
      place_princess(bot_row, bot_column, grid_size)
    end
  end
end