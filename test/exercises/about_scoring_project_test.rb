# frozen_string_literal: true

# SPDX-License-Identifier: CC-BY-NC-SA-3.0
# Adapted from Ruby Koans by Jim Weirich and Joe O'Brien.
# See THIRD_PARTY_NOTICES.md for attribution and license terms.

# Preserve the original descriptive Koans check names.
# rubocop:disable Naming/VariableNumber

require ARGV.shift

class AboutScoringProjectTest < Minitest::Test
  # Checks score of an empty list is zero.
  def test_score_of_an_empty_list_is_zero
    assert_equal 0, Exercises::AboutScoringProject.score([])
  end

  # Checks score of a single roll of 5 is 50.
  def test_score_of_a_single_roll_of_5_is_50
    assert_equal 50, Exercises::AboutScoringProject.score([5])
  end

  # Checks score of a single roll of 1 is 100.
  def test_score_of_a_single_roll_of_1_is_100
    assert_equal 100, Exercises::AboutScoringProject.score([1])
  end

  # Checks score of multiple 1s and 5s is the sum of individual scores.
  def test_score_of_multiple_1s_and_5s_is_the_sum_of_individual_scores
    assert_equal 300, Exercises::AboutScoringProject.score([1, 5, 5, 1])
  end

  # Checks score of single 2s 3s 4s and 6s are zero.
  def test_score_of_single_2s_3s_4s_and_6s_are_zero
    assert_equal 0, Exercises::AboutScoringProject.score([2, 3, 4, 6])
  end

  # Checks score of a triple 1 is 1000.
  def test_score_of_a_triple_1_is_1000
    assert_equal 1000, Exercises::AboutScoringProject.score([1, 1, 1])
  end

  # Checks score of other triples is 100x.
  def test_score_of_other_triples_is_100x
    assert_equal 200, Exercises::AboutScoringProject.score([2, 2, 2])
    assert_equal 300, Exercises::AboutScoringProject.score([3, 3, 3])
    assert_equal 400, Exercises::AboutScoringProject.score([4, 4, 4])
    assert_equal 500, Exercises::AboutScoringProject.score([5, 5, 5])
    assert_equal 600, Exercises::AboutScoringProject.score([6, 6, 6])
  end

  # Checks score of mixed is sum.
  def test_score_of_mixed_is_sum
    assert_equal 250, Exercises::AboutScoringProject.score([2, 5, 2, 2, 3])
    assert_equal 550, Exercises::AboutScoringProject.score([5, 5, 5, 5])
    assert_equal 1100, Exercises::AboutScoringProject.score([1, 1, 1, 1])
    assert_equal 1200, Exercises::AboutScoringProject.score([1, 1, 1, 1, 1])
    assert_equal 1150, Exercises::AboutScoringProject.score([1, 1, 1, 5, 1])
  end
end

# rubocop:enable Naming/VariableNumber
