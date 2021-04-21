require 'spec_helper'
require_relative '../../save_princess'
require_relative '../../grid'

describe SavePrincess do
  it 'should instantiate with a new instance of grid' do
    round1 = SavePrincess.new(5, 2, 3, ["-----\n", "-----\n", "p--m-\n", "-----\n", "-----\n"])

    expect(round1.grid).to be_a Grid
  end

  it 'should instantiate with attributes' do
    round1 = SavePrincess.new(5, 2, 3, ["-----\n", "-----\n", "p--m-\n", "-----\n", "-----\n"])

    expect(round1.bot_column).to eq(3)
    expect(round1.bot_row).to eq(2)
    expect(round1.princess_column).to eq(0)
    expect(round1.princess_row).to eq(2)
  end

  it 'should move left horizontal when on same row' do
    round1 = SavePrincess.new(5, 2, 3, ["-----\n", "-----\n", "p--m-\n", "-----\n", "-----\n"])
    
    round1.next_move

    expect(round1.move.pop).to eq('LEFT')
  end

  it 'should move right horizontal when on same row' do
    round1 = SavePrincess.new(5, 2, 3, ["-----\n", "-----\n", "--m-p\n", "-----\n", "-----\n"])
    
    round1.next_move

    expect(round1.move.pop).to eq('RIGHT')
  end

  it 'should move vertically down if not on same row' do
    round1 = SavePrincess.new(5, 2, 3, ["-----\n", "-----\n", "---m-\n", "-----\n", "p----\n"])
    
    round1.next_move

    expect(round1.move.pop).to eq('DOWN')
  end

  it 'should move vertically up if not on same row' do
    round1 = SavePrincess.new(5, 2, 3, ["--p--\n", "-----\n", "---m-\n", "-----\n", "-----\n"])
    
    round1.next_move

    expect(round1.move.pop).to eq('UP')
  end

  it 'should move vertically up if in the same column' do
    round1 = SavePrincess.new(5, 2, 3, ["-----\n", "---p-\n", "---m-\n", "-----\n", "-----\n"])
    
    round1.next_move

    expect(round1.move.pop).to eq('UP')
  end

  it 'should move vertically down if in the same column' do
    round1 = SavePrincess.new(5, 2, 3, ["-----\n", "-----\n", "---m-\n", "---p-\n", "-----\n"])
    
    round1.next_move

    expect(round1.move.pop).to eq('DOWN')
  end
end
