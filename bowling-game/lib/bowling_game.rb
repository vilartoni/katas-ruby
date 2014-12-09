class BowlingGame

  def initialize
    @rolls = []
  end

  def roll(pins)
    @rolls << pins
  end

  def score
    score = 0
    roll_index = 0

    (0..9).each do
      if spare?(roll_index)
        score += 10 + spare_bonus(roll_index)
        roll_index += 2
      elsif strike?(roll_index)
        score += 10 + strike_bonus(roll_index)
        roll_index += 1
      else
        score += frame_points(roll_index)
        roll_index += 2
      end
    end

    return score
  end

  private

  def spare?(rollIndex)
    10 == @rolls[rollIndex] + @rolls[rollIndex + 1]
  end

  def spare_bonus(roll_index)
    @rolls[roll_index + 2]
  end

  def strike?(roll_index)
    10 == @rolls[roll_index]
  end

  def strike_bonus(roll_index)
    @rolls[roll_index + 1] + @rolls[roll_index + 2]
  end

  def frame_points(roll_index)
    @rolls[roll_index] + @rolls[roll_index + 1]
  end

end
