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
