# frozen_string_literal: true

# SPDX-License-Identifier: CC-BY-NC-SA-3.0
# Adapted from Ruby Koans by Jim Weirich and Joe O'Brien.
# See THIRD_PARTY_NOTICES.md for attribution and license terms.

module Exercises
  # Predictions for blocks examples.
  class AboutBlocks
    # Returns reference predictions for the examples.
    # @return [Hash<Symbol, Object>]
    # This method is an answer table, not a sequence of operations.
    def self.koans
      {
        methods_can_take_blocks_one: 3,
        blocks_can_be_defined_with_do_end_too_one: 3,
        blocks_can_take_arguments_one: 'Jim',
        methods_can_call_yield_many_times_one: %i[peanut butter and jelly],
        methods_can_see_if_they_have_been_called_with_a_block_one: :with_block,
        methods_can_see_if_they_have_been_called_with_a_block_two: :no_block,
        block_can_affect_variables_in_the_code_where_they_are_created_one: :modified_in_a_block,
        blocks_can_be_assigned_to_variables_and_called_explicitly_one: 11,
        blocks_can_be_assigned_to_variables_and_called_explicitly_two: 11,
        stand_alone_blocks_can_be_passed_to_methods_expecting_blocks_one: 'JIM',
        methods_can_take_an_explicit_block_argument_one: 20,
        methods_can_take_an_explicit_block_argument_two: 11
      }
    end
  end
end
