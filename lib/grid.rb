class Grid
  attr_reader :grid
  def initialize(grid_size)
    @grid = Array.new(grid_size)
    create_grid(grid_size)
  end

  def create_grid(grid_size)
    (0...grid_size).each do |i|
      grid[i] = '-' * grid_size
    end
  end
end