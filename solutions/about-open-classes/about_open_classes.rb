# frozen_string_literal: true

# SPDX-License-Identifier: CC-BY-NC-SA-3.0
# Adapted from Ruby Koans by Jim Weirich and Joe O'Brien.
# See THIRD_PARTY_NOTICES.md for attribution and license terms.

module Exercises
  # Predictions for open classes examples.
  class AboutOpenClasses
    # Returns reference predictions for the examples.
    # @return [Hash<Symbol, Object>]
    # This method is an answer table, not a sequence of operations.
    def self.koans
      {
        as_defined_dogs_do_bark_one: 'WOOF',
        after_reopening_dogs_can_both_wag_and_bark_one: 'HAPPY',
        after_reopening_dogs_can_both_wag_and_bark_two: 'WOOF',
        even_existing_built_in_classes_can_be_reopened_one: false,
        even_existing_built_in_classes_can_be_reopened_two: true
      }
    end
  end
end
