require 'spec_helper'
require_relative '../../save_princess'
require_relative '../../bot'
require_relative '../../grid'

describe SavePrincess do
  it 'should instantiate with a new instance of grid and bot' do
    round1 = SavePrincess.new(3)

    expect(round1.bot).to be_a Bot
    expect(round1.grid).to be_a Grid
  end

  it 'should return an array with the path to the princess' do
    round1 = SavePrincess.new(3)

    expect(round1.path_to_princess).to be_an Array
  end
end