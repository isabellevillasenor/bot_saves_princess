class Grid
  attr_reader :grid, 
              :bot_row, 
              :bot_collumn,
              :princess_row,
              :princess_collumn

  def initialize(grid_size)
    raise ArgumentError.new('Grid Size Must Be Greater Than 2, Please Try Again') unless grid_size > 2

    @grid = Array.new(grid_size)
    create_grid(grid_size)
    @bot_row = nil
    @bot_collumn = nil
    place_bot(grid_size)
    @princess_row = nil
    @princess_collumn = nil
    place_princess(@bot_row, @bot_collumn, grid_size)
    # @princess = princess_coordinates.compact.flatten
  end

  def create_grid(grid_size)
    (0...grid_size).each do |i|
      @grid[i] = '-' * grid_size
    end
  end

  def place_bot(grid_size)
    @bot_row = rand(0...(grid_size - 1))
    @bot_collumn = rand(0...(grid_size - 1))
    @grid[@bot_row][@bot_collumn] = 'm'
  end

  def place_princess(bot_row, bot_collumn, grid_size)
    @princess_row = rand(0...(grid_size - 1))
    @princess_collumn = rand(0...(grid_size - 1))
    if [@princess_row, @princess_collumn] != [bot_row, bot_collumn]
      @grid[@princess_row][@princess_collumn] = 'p'
    else
      place_princess(bot_row, bot_collumn, grid_size)
    end
  end
end