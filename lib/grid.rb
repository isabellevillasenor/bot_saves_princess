class Grid
  attr_reader :grid
  def initialize(grid_size)
    raise ArgumentError.new('Grid Size Must Be An Odd Number, Please Try Again') unless grid_size.odd?
    raise ArgumentError.new('Grid Size Must Be Greater Than 2, Please Try Again') unless grid_size > 2
    
    @grid = Array.new(grid_size)
    create_grid(grid_size)
  end

  def create_grid(grid_size)
    (0...grid_size).each do |i|
      grid[i] = '-' * grid_size
    end
  end
end