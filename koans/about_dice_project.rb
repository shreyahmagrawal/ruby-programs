require File.expand_path(File.dirname(__FILE__) + '/neo')

# Implement a DiceSet Class here:
#
class DiceSet
  attr_reader :values
  ################################ GAME PROJECT #################################
  attr_reader :total_dice,:scoring_dice,:non_scoring_dice
  ################################ GAME PROJECT #################################
  def roll (number)
    @values = []
    @total_dice = number
    number.times do
      result = rand(1..6)
      @values.push result
    end
    puts "values of dice roll #{values}"
  end
  # NOTE : score method used in game project by Minal
  def score(dice)
  result = 0
  @scoring_dice = 0
  # First idea: loop through all values and add to hash but only 
  # once per unique value and have a counter for how many times 
  # value was found
  
  # The param for the new() method call acts as a default value if 
  # an accessed key doesn't exist. Awesome! Saved me from writing a 
  # bloated each statement with an if/elsif to handle existence!
    (1..6).each do |i|
        idice = dice.select { |d| d == i }
        if idice.size >= 3
          @scoring_dice += idice.size
            result += (i==1 ? 1000 : i*100)
        end
        if i == 1  || i == 5
          scoring_count = (idice.size % 3)
          result +=  scoring_count * (i == 1 ? 100 : 50)  
          @scoring_dice += scoring_count
        end
    end
  @non_scoring_dice = @total_dice - @scoring_dice
  result
end
def has_scoring_dice
  return @scoring_dice.count > 0 ? true : false 
end
end
class AboutDiceProject < Neo::Koan
  def test_can_create_a_dice_set
    dice = DiceSet.new
    assert_not_nil dice
  end

  def test_rolling_the_dice_returns_a_set_of_integers_between_1_and_6
    dice = DiceSet.new

    dice.roll(5)
    assert dice.values.is_a?(Array), "should be an array"
    assert_equal 5, dice.values.size
    dice.values.each do |value|
      assert value >= 1 && value <= 6, "value #{value} must be between 1 and 6"
    end
  end

  def test_dice_values_do_not_change_unless_explicitly_rolled
    dice = DiceSet.new
    dice.roll(5)
    first_time = dice.values
    second_time = dice.values
    assert_equal first_time, second_time
  end

  def test_dice_values_should_change_between_rolls
    dice = DiceSet.new

    dice.roll(5)
    first_time = dice.values

    dice.roll(5)
    second_time = dice.values

    assert_not_equal first_time, second_time,
      "Two rolls should not be equal"

    # THINK ABOUT IT:
    #
    # If the rolls are random, then it is possible (although not
    # likely) that two consecutive rolls are equal.  What would be a
    # better way to test this?
  end

  def test_you_can_roll_different_numbers_of_dice
    dice = DiceSet.new

    dice.roll(3)
    assert_equal 3, dice.values.size

    dice.roll(1)
    assert_equal 1, dice.values.size
  end

end
