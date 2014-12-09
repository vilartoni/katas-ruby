require 'rspec'
require_relative '../lib/bowling_game'

describe BowlingGame do

  before(:each) do
    @game = BowlingGame.new
  end

  it 'scores zero for a gutter game' do
    roll_many(20, 0)

    expect(@game.score).to eq(0)
  end

  it 'scores twenty for an all ones game' do
    roll_many(20, 1)

    expect(@game.score).to eq(20)
  end

  it 'adds the spare bonus for a spare' do
    roll_spare
    @game.roll(3)
    roll_many(17, 0)

    expect(@game.score).to eq(16)
  end

  it 'adds the strike bonus for a strike' do
    roll_strike
    @game.roll(3)
    @game.roll(5)
    roll_many(16, 0)

    expect(@game.score).to eq(26)
  end

  it 'scores 300 for a perfect game' do
    roll_many(12, 10)

    expect(@game.score).to eq(300)
  end

  private

  def roll_many(n, pins)
    n.times { @game.roll(pins) }
  end

  def roll_spare
    @game.roll(7)
    @game.roll(3)
  end

  def roll_strike
    @game.roll(10)
  end

end
