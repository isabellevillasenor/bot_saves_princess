require_relative 'grid'

class Bot < Grid
  attr_reader :x,
              :y,
              :princess_x,
              :princess_y

  def initialize(grid)
    @x = grid.grid.size.to_f / 2
    @y = grid.grid.size.to_f / 2
    @princess_x = grid.princess.first
    @princess_y = grid.princess.last
  end

  def vertical_movement
    if princess_y == 0 && princess_x == 0
      @y -= 1
      #UP
    elsif princess_y == -1 && princess_x == 0
      @y -= 1
      #UP
    elsif princess_y == 0 && princess_x == -1
      @y += 1
      #DOWN
    elsif princess_y == -1 && princess_x == -1
      @y += 1
      #DOWN
    end
  end

 def horizontal_movement
  if princess_x == 0 && princess_y == 0
    @x -= 1
    #LEFT
  elsif princess_x == -1 && princess_y == 0
    @x -= 1
    #LEFT
  elsif princess_x == 0 && princess_y == -1
    @x += 1
    #RIGHT
  elsif princess_x == -1 && princess_y == -1
    @x += 1
    #RIGHT
  end
 end
end