require 'spec_helper'
require_relative '../../bot'

describe Bot do
  it 'should instantiate with correct x/y coordinates for bot' do
    grid_1 = Grid.new(3)
    grid_2 = Grid.new(99)
    bot_1 = Bot.new(grid_1)
    bot_2 = Bot.new(grid_2)

    expect(bot_1.x).to eq(1)
    expect(bot_1.y).to eq(1)
    expect(bot_2.x).to eq(49)
    expect(bot_2.y).to eq(49)
  end

  it 'should instantiate with the coordinates of the princess' do
    grid = Grid.new(3)
    bot = Bot.new(grid)

    expect(bot.princess_x).to be_an Integer
    expect(bot.princess_y).to be_an Integer
  end
end