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
