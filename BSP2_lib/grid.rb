class Grid
  attr_reader :grid,
              :princess_r,
              :princess_c

  def initialize(grid)
    @grid = grid
    @princess_r = nil
    @princess_c = nil
  end

  def princess_coordinates
    row = @grid.find_index { |r| r.include?('p') }
    column = @grid[row].chars.find_index { |index| index == 'p' }

    @princess_r = row
    @princess_c = column
  end
end
