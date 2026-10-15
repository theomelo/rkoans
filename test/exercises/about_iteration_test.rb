# frozen_string_literal: true

# SPDX-License-Identifier: CC-BY-NC-SA-3.0
# Adapted from Ruby Koans by Jim Weirich and Joe O'Brien.
# See THIRD_PARTY_NOTICES.md for attribution and license terms.

# Preserve the explicit block forms being taught.
# rubocop:disable Style/SymbolProc

require ARGV.shift
require 'tempfile'

class AboutIterationTest < Minitest::Test
  # Checks each is a method on arrays.
  def test_each_is_a_method_on_arrays
    assert_equal Exercises::AboutIteration.koans.fetch(:each_is_a_method_on_arrays_one), [].methods.include?(:each)
  end

  # Checks iterating with each.
  def test_iterating_with_each
    array = [1, 2, 3]
    sum = 0
    array.each do |item|
      sum += item
    end

    assert_equal Exercises::AboutIteration.koans.fetch(:iterating_with_each_one), sum
  end

  # Checks each can use curly brace blocks too.
  def test_each_can_use_curly_brace_blocks_too
    array = [1, 2, 3]
    sum = 0
    array.each { |item| sum += item }

    assert_equal Exercises::AboutIteration.koans.fetch(:each_can_use_curly_brace_blocks_too_one), sum
  end

  # Checks break works with each style iterations.
  def test_break_works_with_each_style_iterations
    array = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
    sum = 0
    array.each do |item|
      break if item > 3

      sum += item
    end

    assert_equal Exercises::AboutIteration.koans.fetch(:break_works_with_each_style_iterations_one), sum
  end

  # Checks collect transforms elements of an array.
  def test_collect_transforms_elements_of_an_array
    array = [1, 2, 3]
    new_array = array.collect { |item| item + 10 }

    assert_equal Exercises::AboutIteration.koans.fetch(:collect_transforms_elements_of_an_array_one), new_array

    # NOTE: 'map' is another name for the 'collect' operation
    another_array = array.map { |item| item + 10 }

    assert_equal Exercises::AboutIteration.koans.fetch(:collect_transforms_elements_of_an_array_two), another_array
  end

  # Checks select selects certain items from an array.
  def test_select_selects_certain_items_from_an_array
    array = [1, 2, 3, 4, 5, 6]

    even_numbers = array.select { |item| item.even? }

    assert_equal Exercises::AboutIteration.koans.fetch(:select_selects_certain_items_from_an_array_one), even_numbers

    # NOTE: 'find_all' is another name for the 'select' operation
    more_even_numbers = array.find_all { |item| item.even? }

    assert_equal Exercises::AboutIteration.koans.fetch(:select_selects_certain_items_from_an_array_two),
                 more_even_numbers
  end

  # Checks find locates the first element matching a criteria.
  def test_find_locates_the_first_element_matching_a_criteria
    array = %w[Jim Bill Clarence Doug Eli]

    found = array.find { |item| item.size > 4 }

    assert_equal Exercises::AboutIteration.koans.fetch(:find_locates_the_first_element_matching_a_criteria_one), found
  end

  # Checks inject will blow your mind.
  def test_inject_will_blow_your_mind
    result = [2, 3, 4].inject(0) { |sum, item| sum + item }

    assert_equal Exercises::AboutIteration.koans.fetch(:inject_will_blow_your_mind_one), result

    result2 = [2, 3, 4].inject(1) { |product, item| product * item }

    assert_equal Exercises::AboutIteration.koans.fetch(:inject_will_blow_your_mind_two), result2

    # Extra Credit:
    # Describe in your own words what inject does.
  end

  # Checks all iteration methods work on any collection not just arrays.
  def test_all_iteration_methods_work_on_any_collection_not_just_arrays
    # Ranges act like a collection
    result = (1..3).map { |item| item + 10 }

    assert_equal Exercises::AboutIteration.koans.fetch(:all_iteration_methods_work_on_any_collection_not_just_arrays_one),
                 result

    # Files act like a collection of lines
    with_example_file do |file|
      upcase_lines = file.map { |line| line.strip.upcase }

      assert_equal Exercises::AboutIteration.koans.fetch(:all_iteration_methods_work_on_any_collection_not_just_arrays_two),
                   upcase_lines
    end

    # NOTE: You can create your own collections that work with each,
    # map, select, etc.
  end

  # Bonus Question:  In the previous koan, we saw the construct:
  #
  #   File.open(filename) do |file|
  #     # code to read 'file'
  #   end
  #
  # Why did we do it that way instead of the following?
  #
  #   file = File.open(filename)
  #   # code to read 'file'
  #
  # When you get to the "AboutSandwichCode" koan, recheck your answer.

  # Supplies the original four-line example without relying on the working directory.
  # @yieldparam file [File] rewound example file
  # @return [Object] block result
  def with_example_file
    Tempfile.create('rkoans-iteration') do |file|
      file.write("this\nis\na\ntest\n")
      file.rewind
      yield file
    end
  end
end

# rubocop:enable Style/SymbolProc
