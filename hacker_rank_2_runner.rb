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

class SavePrincess
  attr_accessor :grid,
                :bot_row,
                :bot_column,
                :princess_r,
                :princess_c

  def initialize(n, row, column, grid)
    @grid = Grid.new(grid)
    @bot_column = column
    @bot_row = row
    @grid.princess_coordinates
    @princess_column = @grid.princess_c
    @princess_row = @grid.princess_r
    @move = []
  end

  def next_move
    if (@bot_row == @princess_row)
      horizontal_movement
    else 
      vertical_movement
    end
    puts @move
  end

  def horizontal_movement
    if @bot_column > @princess_column
      @bot_column -= 1
      @move << 'LEFT'
    elsif @bot_column < @princess_column
      @bot_column += 1
      @move << 'RIGHT'
    end
  end

  def vertical_movement
    if @bot_column == @princess_column
      if @bot_row > @princess_row
        @bot_row -= 1
        @move << 'UP'
      elsif @bot_row < @princess_row
        @bot_row += 1
        @move << 'DOWN'
      end
    else
      if @bot_row > @princess_row
        @bot_row -= 1
        @move << 'UP'
      elsif @bot_row < @princess_row
        @bot_row += 1
        @move << 'DOWN'
      end
    end
  end
end

def nextMove(n,r,c,grid)
  save_princess = SavePrincess.new(n, r, c, grid)
  save_princess.next_move
end

n = gets.to_i

r,c = gets.strip.split.map {|num| num.to_i}

grid = Array.new(n)

(0...n).each do |i|
  grid[i] = gets
end

nextMove(n,r,c,grid)