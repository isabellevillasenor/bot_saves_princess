require 'spec_helper'
require_relative '../../bot'

describe Bot do
  it 'should instantiate with correct x/y coordinates for bot' do
    grid = Grid.new(3, ["---", "-m-", "p--"])
    bot = Bot.new(grid)

    expect(bot.x).to eq(1)
    expect(bot.y).to eq(1)
  end

  it 'should instantiate with correct coordinates for princess' do
    grid = Grid.new(3, ["---", "-m-", "p--"])
    bot = Bot.new(grid)

    expect(bot.princess_x).to eq(2)
    expect(bot.princess_y).to eq(0)
  end
end