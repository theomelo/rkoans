# frozen_string_literal: true

# SPDX-License-Identifier: CC-BY-NC-SA-3.0
# Adapted from Ruby Koans by Jim Weirich and Joe O'Brien.
# See THIRD_PARTY_NOTICES.md for attribution and license terms.

module Exercises
  # Predictions for keyword arguments examples.
  class AboutKeywordArguments
    # Returns reference predictions for the examples.
    # @return [Hash<Symbol, Object>]
    # This method is an answer table, not a sequence of operations.
    def self.koans
      {
        keyword_arguments_one: ::Array,
        keyword_arguments_two: [1, 'two'],
        keyword_arguments_three: %w[one two],
        keyword_arguments_four: [1, 2],
        keyword_arguments_with_wrong_number_of_arguments_one: ::ArgumentError,
        keyword_arguments_with_wrong_number_of_arguments_two: 'wrong number of arguments',
        mandatory_keyword_arguments_one: %w[one two],
        mandatory_keyword_arguments_two: [1, 2],
        mandatory_keyword_arguments_without_mandatory_argument_one: ::ArgumentError,
        mandatory_keyword_arguments_without_mandatory_argument_two: 'missing keyword'
      }
    end
  end
end
