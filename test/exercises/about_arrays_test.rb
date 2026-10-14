# frozen_string_literal: true

# Explicit array literals preserve the introductory examples.
# rubocop:disable Style/SymbolArray

# SPDX-License-Identifier: CC-BY-NC-SA-3.0
# Adapted from Ruby Koans by Jim Weirich and Joe O'Brien.
# See THIRD_PARTY_NOTICES.md for attribution and license terms.

require ARGV.shift

# Observes array values before and after indexing, slicing, and mutations.
class AboutArraysTest < Minitest::Test
  # A new array has a type and an initial size.
  def test_creating_arrays
    empty_array = Array.new # rubocop:disable Style/EmptyLiteral
    answers = Exercises::AboutArrays.koans

    assert_equal answers[:empty_type], empty_array.class
    assert_equal answers[:empty_size], empty_array.size
  end

  # Indexed assignment and appending build an array incrementally.
  def test_array_literals
    array = Array.new # rubocop:disable Style/EmptyLiteral

    assert_equal [], array

    array[0] = 1

    assert_equal [1], array

    answers = Exercises::AboutArrays.koans
    array[1] = 2

    assert_equal [1, answers[:second_literal]], array

    array << 333

    assert_equal answers[:after_append], array
  end

  # Positive indexes count from the start; negative indexes count from the end.
  def test_accessing_array_elements
    array = [:peanut, :butter, :and, :jelly]
    answers = Exercises::AboutArrays.koans

    assert_equal answers[:first_index], array[0]
    assert_equal answers[:first_method], array.first
    assert_equal answers[:last_index], array[3]
    assert_equal answers[:last_method], array.last
    assert_equal answers[:negative_last], array[-1]
    assert_equal answers[:negative_third], array[-3]
  end

  # Slices distinguish a starting index at the end from one beyond the end.
  def test_slicing_arrays
    array = [:peanut, :butter, :and, :jelly]
    answers = Exercises::AboutArrays.koans

    assert_equal answers[:slice_one], array[0, 1]
    assert_equal answers[:slice_two], array[0, 2]
    assert_equal answers[:slice_tail], array[2, 2]
    assert_equal answers[:slice_long_tail], array[2, 20]
    assert_equal answers[:slice_at_end_zero], array[4, 0]
    assert_equal answers[:slice_at_end_long], array[4, 100]
    assert_equal answers[:slice_beyond_end], array[5, 0]
  end

  # A range differs from an array and can include or exclude its endpoint.
  def test_arrays_and_ranges
    answers = Exercises::AboutArrays.koans

    assert_equal answers[:range_type], (1..5).class
    refute_equal [1, 2, 3, 4, 5], (1..5)
    assert_equal answers[:inclusive_range], (1..5).to_a
    assert_equal answers[:exclusive_range], (1...5).to_a
  end

  # Ranges select slices and can end at a negative index.
  def test_slicing_with_ranges
    array = [:peanut, :butter, :and, :jelly]
    answers = Exercises::AboutArrays.koans

    assert_equal answers[:inclusive_slice], array[0..2]
    assert_equal answers[:exclusive_slice], array[0...2]
    assert_equal answers[:negative_range_slice], array[2..-1] # rubocop:disable Style/SlicingWithRange
  end

  # Push and pop change the end of an array; pop returns the removed element.
  def test_pushing_and_popping_arrays
    array = [1, 2]
    array.push(:last)
    answers = Exercises::AboutArrays.koans

    assert_equal answers[:after_push], array

    popped_value = array.pop

    assert_equal answers[:popped_value], popped_value
    assert_equal answers[:after_pop], array
  end

  # Unshift and shift change the start; shift returns the removed element.
  def test_shifting_arrays
    array = [1, 2]
    array.unshift(:first)
    answers = Exercises::AboutArrays.koans

    assert_equal answers[:after_unshift], array

    shifted_value = array.shift

    assert_equal answers[:shifted_value], shifted_value
    assert_equal answers[:after_shift], array
  end
end

# rubocop:enable Style/SymbolArray
