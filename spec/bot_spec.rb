require 'spec_helper'
require '../lib/bot'

describe Bot do
  it 'should instantiate with correct x/y coordinates for bot' do
    grid_1 = Grid.new(3)
    grid_2 = Grid.new(99)
    bot_1 = Bot.new(grid_1)
    bot_2 = Bot.new(grid_2)

    expect(bot_1.x).to eq(1.5)
    expect(bot_1.y).to eq(1.5)
    expect(bot_2.x).to eq(49.5)
    expect(bot_2.y).to eq(49.5)
  end

  it 'should instantiate with the coordinates of the princess' do
    grid = Grid.new(3)
    bot = Bot.new(grid)

    expect(bot.princess_x).to be_an Integer
    expect(bot.princess_y).to be_an Integer
  end

  it 'should move vertically' do
    grid = Grid.new(3)
    bot = Bot.new(grid)

    expect(bot.x).to eq(1.5)
    expect(bot.y).to eq(1.5)

    bot.vertical_movement

    expect(bot.x).to eq(1.5)
    expect{bot.vertical_movement}.to change{bot.y}
  end

  it 'should move horizontally' do
    grid = Grid.new(3)
    bot = Bot.new(grid)

    expect(bot.x).to eq(1.5)
    expect(bot.y).to eq(1.5)

    bot.horizontal_movement

    expect(bot.y).to eq(1.5)
    expect{bot.horizontal_movement}.to change{bot.x}
  end
end