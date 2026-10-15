# frozen_string_literal: true

# SPDX-License-Identifier: CC-BY-NC-SA-3.0
# Adapted from Ruby Koans by Jim Weirich and Joe O'Brien.
# See THIRD_PARTY_NOTICES.md for attribution and license terms.

module Exercises
  # Predictions for blocks examples.
  class AboutBlocks
    # Replace each :fill_me_in with the result of the described expression.
    # @return [Hash<Symbol, Object>]
    # This method is an answer table, not a sequence of operations.
    def self.koans
      {
        # Methods can take blocks.
        # yielded_result = method_with_block { 1 + 2 }
        # assert_equal __, yielded_result
        # Predict: yielded_result
        methods_can_take_blocks_one: :fill_me_in,
        # Blocks can be defined with do end too.
        # yielded_result = method_with_block do 1 + 2 end
        # assert_equal __, yielded_result
        # Predict: yielded_result
        blocks_can_be_defined_with_do_end_too_one: :fill_me_in,
        # Blocks can take arguments.
        # method_with_block_arguments do |argument|
        # assert_equal __, argument
        # end
        # Predict: argument
        blocks_can_take_arguments_one: :fill_me_in,
        # Methods can call yield many times.
        # result = []
        # many_yields { |item| result << item }
        # assert_equal __, result
        # Predict: result
        methods_can_call_yield_many_times_one: :fill_me_in,
        # Methods can see if they have been called with a block.
        # assert_equal __, yield_tester { :with_block }
        # assert_equal __, yield_tester
        # Predict: yield_tester { :with_block }
        methods_can_see_if_they_have_been_called_with_a_block_one: :fill_me_in,
        # Predict: yield_tester
        methods_can_see_if_they_have_been_called_with_a_block_two: :fill_me_in,
        # Block can affect variables in the code where they are created.
        # value = :initial_value
        # method_with_block { value = :modified_in_a_block }
        # assert_equal __, value
        # Predict: value
        block_can_affect_variables_in_the_code_where_they_are_created_one: :fill_me_in,
        # Blocks can be assigned to variables and called explicitly.
        # add_one = lambda { |n| n + 1 }
        # assert_equal __, add_one.call(10)
        # Alternative calling syntax
        # assert_equal __, add_one[10]
        # Predict: add_one.call(10)
        blocks_can_be_assigned_to_variables_and_called_explicitly_one: :fill_me_in,
        # Predict: add_one[10]
        blocks_can_be_assigned_to_variables_and_called_explicitly_two: :fill_me_in,
        # Stand alone blocks can be passed to methods expecting blocks.
        # make_upper = lambda { |n| n.upcase }
        # result = method_with_block_arguments(&make_upper)
        # assert_equal __, result
        # Predict: result
        stand_alone_blocks_can_be_passed_to_methods_expecting_blocks_one: :fill_me_in,
        # Methods can take an explicit block argument.
        # assert_equal __, method_with_explicit_block { |n| n * 2 }
        # add_one = lambda { |n| n + 1 }
        # assert_equal __, method_with_explicit_block(&add_one)
        # Predict: method_with_explicit_block { |n| n * 2 }
        methods_can_take_an_explicit_block_argument_one: :fill_me_in,
        # Predict: method_with_explicit_block(&add_one)
        methods_can_take_an_explicit_block_argument_two: :fill_me_in
      }
    end
  end
end
