# frozen_string_literal: true

# SPDX-License-Identifier: CC-BY-NC-SA-3.0
# Adapted from Ruby Koans by Jim Weirich and Joe O'Brien.
# See THIRD_PARTY_NOTICES.md for attribution and license terms.

module Exercises
  # Predictions for constants examples.
  class AboutConstants
    # Returns reference predictions for the examples.
    # @return [Hash<Symbol, Object>]
    # This method is an answer table, not a sequence of operations.
    def self.koans
      {
        nested_constants_may_also_be_referenced_with_relative_paths_one: 'nested',
        top_level_constants_are_referenced_by_double_colons_one: 'top level',
        nested_constants_are_referenced_by_their_complete_path_one: 'nested',
        nested_constants_are_referenced_by_their_complete_path_two: 'nested',
        nested_classes_inherit_constants_from_enclosing_classes_one: 4,
        subclasses_inherit_constants_from_parent_classes_one: 4,
        who_wins_with_both_nested_and_inherited_constants_one: 2,
        who_wins_with_explicit_scoping_on_class_definition_one: 4
      }
    end
  end
end
