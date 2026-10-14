# frozen_string_literal: true

# SPDX-License-Identifier: CC-BY-NC-SA-3.0
# Adapted from Ruby Koans by Jim Weirich and Joe O'Brien.
# See THIRD_PARTY_NOTICES.md for attribution and license terms.

require ARGV.shift

# Keeps the original truthiness examples and their independently evaluated branches.
class AboutTrueAndFalseTest < Minitest::Test
  # @param condition [Object] value tested by Ruby's ordinary if statement
  # @return [Symbol] branch selected by Ruby
  def truth_value(condition)
    if condition
      :true_stuff
    else
      :false_stuff
    end
  end

  # True selects the truthy branch.
  def test_true_is_treated_as_true
    assert_equal truth_value(true), Exercises::AboutTrueAndFalse.koans[:true_value]
  end

  # False selects the falsey branch.
  def test_false_is_treated_as_false
    assert_equal truth_value(false), Exercises::AboutTrueAndFalse.koans[:false_value]
  end

  # Nil selects the same branch as false.
  def test_nil_is_treated_as_false_too
    assert_equal truth_value(nil), Exercises::AboutTrueAndFalse.koans[:nil_value]
  end

  # Zero and empty containers are truthy, just like other ordinary objects.
  def test_everything_else_is_treated_as_true
    values = { one: 1, zero: 0, empty_array: [], empty_hash: {}, string: 'Strings', empty_string: '' }
    answers = Exercises::AboutTrueAndFalse.koans

    values.each { |key, value| assert_equal truth_value(value), answers[key], "Branch for #{key}" }
  end
end
