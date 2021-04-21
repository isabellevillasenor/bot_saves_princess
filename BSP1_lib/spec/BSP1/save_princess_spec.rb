require 'spec_helper'
require_relative '../../save_princess'
require_relative '../../bot'
require_relative '../../grid'

describe SavePrincess do
  it 'should instantiate with a new instance of grid and bot' do
    round1 = SavePrincess.new(3, ["---", "-m-", "p--"])

    expect(round1.bot).to be_a Bot
    expect(round1.grid).to be_a Grid
  end

  it 'should instantiate with attributes' do
    round1 = SavePrincess.new(3, ["---", "-m-", "p--"])

    expect(round1.bot_column).to eq(1)
    expect(round1.bot_row).to eq(1)
    expect(round1.princess_column).to eq(0)
    expect(round1.princess_row).to eq(2)
  end

  it 'should return an array with the path to the princess' do
    round1 = SavePrincess.new(3, ["---", "-m-", "p--"])

    expect(round1.path_to_princess).to eq(["DOWN", "LEFT"])
  end

  it 'should return an array with the path to the princess' do
    round1 = SavePrincess.new(3, ["---", "-m-", "--p"])

    expect(round1.path_to_princess).to eq(["DOWN", "RIGHT"])
  end

  it 'should return an array with the path to the princess' do
    round1 = SavePrincess.new(3, ["p--", "-m-", "---"])

    expect(round1.path_to_princess).to eq(["UP", "LEFT"])
  end

  it 'should return an array with the path to the princess' do
    round1 = SavePrincess.new(3, ["--p", "-m-", "---"])

    expect(round1.path_to_princess).to eq(["UP", "RIGHT"])
  end
end