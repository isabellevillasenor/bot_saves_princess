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
