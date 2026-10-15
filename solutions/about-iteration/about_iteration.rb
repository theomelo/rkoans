# frozen_string_literal: true

# SPDX-License-Identifier: CC-BY-NC-SA-3.0
# Adapted from Ruby Koans by Jim Weirich and Joe O'Brien.
# See THIRD_PARTY_NOTICES.md for attribution and license terms.

module Exercises
  # Predictions for iteration examples.
  class AboutIteration
    # Returns reference predictions for the examples.
    # @return [Hash<Symbol, Object>]
    # This method is an answer table, not a sequence of operations.
    def self.koans
      {
        each_is_a_method_on_arrays_one: true,
        iterating_with_each_one: 6,
        each_can_use_curly_brace_blocks_too_one: 6,
        break_works_with_each_style_iterations_one: 6,
        collect_transforms_elements_of_an_array_one: [11, 12, 13],
        collect_transforms_elements_of_an_array_two: [11, 12, 13],
        select_selects_certain_items_from_an_array_one: [2, 4, 6],
        select_selects_certain_items_from_an_array_two: [2, 4, 6],
        find_locates_the_first_element_matching_a_criteria_one: 'Clarence',
        inject_will_blow_your_mind_one: 9,
        inject_will_blow_your_mind_two: 24,
        all_iteration_methods_work_on_any_collection_not_just_arrays_one: [11, 12, 13],
        all_iteration_methods_work_on_any_collection_not_just_arrays_two: %w[THIS IS A TEST]
      }
    end
  end
end
