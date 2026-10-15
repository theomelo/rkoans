# frozen_string_literal: true

# SPDX-License-Identifier: CC-BY-NC-SA-3.0
# Adapted from Ruby Koans by Jim Weirich and Joe O'Brien.
# See THIRD_PARTY_NOTICES.md for attribution and license terms.

module Exercises
  # Predictions for to str examples.
  class AboutToStr
    # Returns reference predictions for the examples.
    # @return [Hash<Symbol, Object>]
    # This method is an answer table, not a sequence of operations.
    def self.koans
      {
        to_s_returns_a_string_representation_one: 'non-string-like',
        normally_objects_cannot_be_used_where_strings_are_expected_one: ::TypeError,
        to_str_also_returns_a_string_representation_one: 'string-like',
        to_str_allows_objects_to_be_treated_as_strings_one: false,
        user_defined_code_can_check_for_to_str_one: false,
        user_defined_code_can_check_for_to_str_two: true
      }
    end
  end
end
