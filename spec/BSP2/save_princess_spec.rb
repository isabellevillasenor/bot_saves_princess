require 'spec_helper'
require_relative '../../BSP2_lib/save_princess'
require_relative '../../BSP2_lib/grid'

describe SavePrincess do
  it 'should instantiate with a new instance of grid' do
    round1 = SavePrincess.new(3, 0, 0)

    expect(round1.grid).to be_a Grid
  end

  it 'should instantiate with attributes' do
    round1 = SavePrincess.new(3, 0, 0)

    expect(round1.bot_column).to be_an Integer
    expect(round1.bot_row).to be_an Integer
    expect(round1.princess_column).to be_an Integer
    expect(round1.princess_row).to be_an Integer
  end

  it 'should move left horizontal when on same row' do
    round1 = SavePrincess.new(3, 1, 2)

    round1.princess_row = 1
    round1.princess_column = 0
    round1.next_move

    expect(round1.next_move).to be_a String
    expect(round1.bot_column).to be_zero
  end

  it 'should move right horizontal when on same row' do
    round1 = SavePrincess.new(3, 1, 1)

    round1.princess_row = 1
    round1.princess_column = 2
    round1.next_move

    expect(round1.bot_column).to eq(2)
  end

  it 'should move vertically down if not on same row' do
    round1 = SavePrincess.new(3, 1, 2)

    round1.princess_row = 2
    round1.princess_column = 0

    expect(round1.next_move).to be_a String
    expect(round1.bot_row).to eq(2)
  end

  it 'should move vertically up if not on same row' do
    round1 = SavePrincess.new(3, 1, 2)

    round1.princess_row = 0
    round1.princess_column = 0

    expect(round1.next_move).to be_a String
    expect(round1.bot_row).to eq(0)
  end

  it 'should move vertically up if in the same column' do
    round1 = SavePrincess.new(3, 1, 2)

    round1.princess_row = 0
    round1.princess_column = 2

    expect(round1.next_move).to be_a String
    expect(round1.bot_row).to eq(0)
  end

  it 'should move vertically down if in the same column' do
    round1 = SavePrincess.new(3, 1, 2)

    round1.princess_row = 2
    round1.princess_column = 2

    expect(round1.next_move).to be_a String
    expect(round1.bot_row).to eq(2)
  end

  it 'should know when princess is saved' do
    round1 = SavePrincess.new(3, 0, 1)

    round1.princess_row = 0
    round1.princess_column = 0

    expect(round1.next_move).to be_a String
    expect(round1.bot_row).to be_zero
    expect(round1.princess_saved).to be true
  end
end
