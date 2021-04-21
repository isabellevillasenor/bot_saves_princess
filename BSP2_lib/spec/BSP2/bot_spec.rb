require 'spec_helper'
require_relative '../../bot'

describe Bot do
  it 'should instantiate with correct r/c coordinates for bot' do
    grid_1 = Grid.new(3, 0, 0)
    grid_2 = Grid.new(99, 24, 13)
    bot_1 = Bot.new(grid_1)
    bot_2 = Bot.new(grid_2)

    expect(bot_1.bot_row).to be_zero
    expect(bot_1.bot_column).to be_zero
    expect(bot_2.bot_row).to eq(24)
    expect(bot_2.bot_column).to eq(13)
  end

  it 'should instantiate with r/c coordinates for the princess' do
    grid = Grid.new(3, 0, 0)
    bot = Bot.new(grid)

    expect(bot.princess_row).to be_an Integer
    expect(bot.princess_row).to eq(grid.princess_r)
    expect(bot.princess_column).to be_an Integer
    expect(bot.princess_column).to eq(grid.princess_c)
  end
end