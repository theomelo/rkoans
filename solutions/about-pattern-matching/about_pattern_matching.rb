# frozen_string_literal: true

# SPDX-License-Identifier: CC-BY-NC-SA-3.0
# Adapted from Ruby Koans by Jim Weirich and Joe O'Brien.
# See THIRD_PARTY_NOTICES.md for attribution and license terms.

module Exercises
  # Predictions for pattern matching examples.
  class AboutPatternMatching
    # Returns reference predictions for the examples.
    # @return [Hash<Symbol, Object>]
    # This method is an answer table, not a sequence of operations.
    def self.koans # rubocop:disable Metrics/MethodLength
      {
        pattern_may_not_match_one: ::NoMatchingPatternError,
        we_can_use_else_one: :no_match,
        value_pattern_one: :match_exact_value,
        value_pattern_two: :match_in_range,
        value_pattern_three: :match_with_class,
        value_pattern_four: :no_match,
        variable_pattern_with_binding_one: 0,
        variable_pattern_with_pin_one: :no_match,
        pattern_with_dropping_one: :match,
        pattern_with_dropping_two: :no_match,
        alternative_pattern_one: :match,
        alternative_pattern_two: :match,
        alternative_pattern_three: :match,
        alternative_pattern_four: :no_match,
        as_pattern_one: 'I was petrified',
        array_pattern_one: %w[b c],
        array_pattern_two: :no_match,
        hash_pattern_one: [3, 2],
        hash_pattern_two: [0, 0],
        hash_pattern_with_sugar_one: [3, 2],
        hash_pattern_with_sugar_two: [0, 0]
      }
    end
  end
end
