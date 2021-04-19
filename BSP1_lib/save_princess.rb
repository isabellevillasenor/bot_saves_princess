require_relative 'bot'
require_relative 'grid'

class SavePrincess < Bot
  attr_accessor :grid,
                :x,
                :y,
                :princess_x,
                :princess_y
  attr_reader   :grid, :bot

  def initialize(grid_size)
    @grid = Grid.new(grid_size)
    @bot = Bot.new(@grid)
    @y = bot.y
    @x = bot.x
    @princess_y = bot.princess_y
    @princess_x = bot.princess_x
  end

  def path_to_princess
    moves_to_princess = []
    moves_to_princess << vertical_movement until @x == @princess_x
    moves_to_princess << horizontal_movement until @y == @princess_y
    moves_to_princess
  end

  def horizontal_movement
    if @y > @princess_y
      @y -= 1
      'LEFT'
    elsif @y < @princess_y
      @y += 1
      'RIGHT'
    end
  end

  def vertical_movement
    if @x > @princess_x
      @x -= 1
      'UP'
    elsif @x < @princess_x
      @x += 1
      'DOWN'
    end
  end
end
