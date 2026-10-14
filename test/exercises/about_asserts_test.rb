# frozen_string_literal: true

# SPDX-License-Identifier: CC-BY-NC-SA-3.0
# Adapted from Ruby Koans by Jim Weirich and Joe O'Brien.
# See THIRD_PARTY_NOTICES.md for attribution and license terms.

require ARGV.shift

# Introduces assertion truth, failure messages, equality, and expected values.
class AboutAssertsTest < Minitest::Test
  # We shall contemplate truth by testing reality, via asserts.
  def test_assert_truth
    assert Exercises::AboutAsserts.koans[:truth]
  end

  # Enlightenment may be more easily achieved with appropriate messages.
  def test_assert_with_message
    assert Exercises::AboutAsserts.koans[:with_message], 'This should be true -- Please fix this'
  end

  # Compare expectations with reality using bare assert before the better diagnostic below.
  def test_assert_equality
    expected_value = Exercises::AboutAsserts.koans[:expected_value]
    actual_value = 1 + 1

    assert expected_value == actual_value # rubocop:disable Minitest/AssertEqual, Minitest/AssertOperator
  end

  # Some ways of asserting equality are better than others.
  def test_a_better_way_of_asserting_equality
    expected_value = Exercises::AboutAsserts.koans[:better_expected_value]
    actual_value = 1 + 1

    assert_equal expected_value, actual_value
  end

  # Sometimes we will ask you to fill in the values.
  def test_fill_in_values
    assert_equal Exercises::AboutAsserts.koans[:filled_value], 1 + 1
  end
end
