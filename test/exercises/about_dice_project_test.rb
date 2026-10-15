# frozen_string_literal: true

# SPDX-License-Identifier: CC-BY-NC-SA-3.0
# Adapted from Ruby Koans by Jim Weirich and Joe O'Brien.
# See THIRD_PARTY_NOTICES.md for attribution and license terms.

require ARGV.shift

class AboutDiceProjectTest < Minitest::Test
  # A new set is empty and can roll different counts without accumulating old dice.
  def test_can_create_and_resize_a_dice_set
    dice = Exercises::AboutDiceProject::DiceSet.new(random: Random.new(12))

    assert_empty dice.values
    [5, 3, 1, 0].each do |count|
      dice.roll(count)

      assert_equal count, dice.values.size
      values = dice.values
      values.each do |value|
        assert_instance_of Integer, value
        assert_includes 1..6, value
      end
    end
  end

  # Replaying a seeded source checks rerolling without assuming random rolls differ.
  def test_rolls_use_the_random_source_and_values_stay_stable
    dice = Exercises::AboutDiceProject::DiceSet.new(random: Random.new(12))
    oracle = Random.new(12)
    2.times do
      expected = Array.new(5) { oracle.rand(1..6) }
      dice.roll(5)
      first_read = dice.values.dup

      assert_equal expected, first_read
      assert_equal first_read, dice.values
    end
  end
end
