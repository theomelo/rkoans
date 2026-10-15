# frozen_string_literal: true

# SPDX-License-Identifier: CC-BY-NC-SA-3.0
# Adapted from Ruby Koans by Jim Weirich and Joe O'Brien.
# See THIRD_PARTY_NOTICES.md for attribution and license terms.

module Exercises
  # Predictions for iteration examples.
  class AboutIteration
    # Replace each :fill_me_in with the result of the described expression.
    # @return [Hash<Symbol, Object>]
    # This method is an answer table, not a sequence of operations.
    def self.koans
      {
        # Each is a method on arrays.
        # assert_equal __, [].methods.include?(:each)
        # Predict: [].methods.include?(:each)
        each_is_a_method_on_arrays_one: :fill_me_in,
        # Iterating with each.
        # array = [1, 2, 3]
        # sum = 0
        # array.each do |item|
        # sum += item
        # end
        # assert_equal __, sum
        # Predict: sum
        iterating_with_each_one: :fill_me_in,
        # Each can use curly brace blocks too.
        # array = [1, 2, 3]
        # sum = 0
        # array.each { |item| sum += item }
        # assert_equal __, sum
        # Predict: sum
        each_can_use_curly_brace_blocks_too_one: :fill_me_in,
        # Break works with each style iterations.
        # array = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
        # sum = 0
        # array.each do |item|
        # break if item > 3
        # sum += item
        # end
        # assert_equal __, sum
        # Predict: sum
        break_works_with_each_style_iterations_one: :fill_me_in,
        # Collect transforms elements of an array.
        # array = [1, 2, 3]
        # new_array = array.collect { |item| item + 10 }
        # assert_equal __, new_array
        # NOTE: 'map' is another name for the 'collect' operation
        # another_array = array.map { |item| item + 10 }
        # assert_equal __, another_array
        # Predict: new_array
        collect_transforms_elements_of_an_array_one: :fill_me_in,
        # Predict: another_array
        collect_transforms_elements_of_an_array_two: :fill_me_in,
        # Select selects certain items from an array.
        # array = [1, 2, 3, 4, 5, 6]
        # even_numbers = array.select { |item| (item % 2) == 0 }
        # assert_equal __, even_numbers
        # NOTE: 'find_all' is another name for the 'select' operation
        # more_even_numbers = array.find_all { |item| (item % 2) == 0 }
        # assert_equal __, more_even_numbers
        # Predict: even_numbers
        select_selects_certain_items_from_an_array_one: :fill_me_in,
        # Predict: more_even_numbers
        select_selects_certain_items_from_an_array_two: :fill_me_in,
        # Find locates the first element matching a criteria.
        # array = ["Jim", "Bill", "Clarence", "Doug", "Eli"]
        # assert_equal __, array.find { |item| item.size > 4 }
        # Predict: array.find { |item| item.size > 4 }
        find_locates_the_first_element_matching_a_criteria_one: :fill_me_in,
        # Inject will blow your mind.
        # result = [2, 3, 4].inject(0) { |sum, item| sum + item }
        # assert_equal __, result
        # result2 = [2, 3, 4].inject(1) { |product, item| product * item }
        # assert_equal __, result2
        # Predict: result
        inject_will_blow_your_mind_one: :fill_me_in,
        # Predict: result2
        inject_will_blow_your_mind_two: :fill_me_in,
        # All iteration methods work on any collection not just arrays.
        # result = (1..3).map { |item| item + 10 }
        # assert_equal __, result
        # Files act like a collection of lines
        # with_example_file do |file|
        # upcase_lines = file.map { |line| line.strip.upcase }
        # assert_equal __, upcase_lines
        # end
        # Predict: result
        all_iteration_methods_work_on_any_collection_not_just_arrays_one: :fill_me_in,
        # Predict: upcase_lines
        all_iteration_methods_work_on_any_collection_not_just_arrays_two: :fill_me_in
      }
    end
  end
end
