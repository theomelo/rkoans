# frozen_string_literal: true

# SPDX-License-Identifier: CC-BY-NC-SA-3.0
# Adapted from Ruby Koans by Jim Weirich and Joe O'Brien.
# See THIRD_PARTY_NOTICES.md for attribution and license terms.

module Exercises
  # A reference implementation for comparison after completing the exercise.
  class AboutAsserts
    # Returns the truth values and expected sums for the introductory assertions.
    # @return [Hash<Symbol, Boolean | Integer>]
    def self.koans
      {
        truth: true,
        with_message: true,
        expected_value: 2,
        better_expected_value: 2,
        filled_value: 2
      }
    end
  end
end
