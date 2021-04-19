require 'spec_helper'
require_relative '../../BSP2_lib/save_princess'
require_relative '../../BSP2_lib/grid'

describe SavePrincess do
  it 'should instantiate with a new instance of grid' do
    round1 = SavePrincess.new(3)

    expect(round1.grid).to be_a Grid
  end

  it 'should instantiate with attributes' do
    round1 = SavePrincess.new(3)

    expect(round1.bot_column).to be_an Integer
    expect(round1.bot_row).to be_an Integer
    expect(round1.princess_column).to be_an Integer
    expect(round1.princess_row).to be_an Integer
  end

  it 'should move to princess' do
    round1 = SavePrincess.new(3)

    expect(round1.next_move).to be_a String
  end
end