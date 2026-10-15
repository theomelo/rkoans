# frozen_string_literal: true

# SPDX-License-Identifier: CC-BY-NC-SA-3.0
# Adapted from Ruby Koans by Jim Weirich and Joe O'Brien.
# See THIRD_PARTY_NOTICES.md for attribution and license terms.

module Exercises
  # Predictions for keyword arguments examples.
  class AboutKeywordArguments
    # Replace each :fill_me_in with the result of the described expression.
    # @return [Hash<Symbol, Object>]
    # This method is an answer table, not a sequence of operations.
    def self.koans
      {
        # Keyword arguments.
        # assert_equal __, method_with_keyword_arguments.class
        # assert_equal __, method_with_keyword_arguments
        # assert_equal __, method_with_keyword_arguments(one: 'one')
        # assert_equal __, method_with_keyword_arguments(two: 2)
        # Predict: method_with_keyword_arguments.class
        keyword_arguments_one: :fill_me_in,
        # Predict: method_with_keyword_arguments
        keyword_arguments_two: :fill_me_in,
        # Predict: method_with_keyword_arguments(one: 'one')
        keyword_arguments_three: :fill_me_in,
        # Predict: method_with_keyword_arguments(two: 2)
        keyword_arguments_four: :fill_me_in,
        # Keyword arguments with wrong number of arguments.
        # exception = assert_raise (___) do
        # method_with_keyword_arguments_with_mandatory_argument
        # end
        # assert_match(/__/, exception.message)
        # Predict: exception class from: method_with_keyword_arguments_with_mandatory_argument
        keyword_arguments_with_wrong_number_of_arguments_one: :fill_me_in,
        # Predict: exception.message
        keyword_arguments_with_wrong_number_of_arguments_two: :fill_me_in,
        # Mandatory keyword arguments.
        # assert_equal __, method_with_mandatory_keyword_arguments(one: 'one')
        # assert_equal __, method_with_mandatory_keyword_arguments(two: 2, one: 1)
        # Predict: method_with_mandatory_keyword_arguments(one: 'one')
        mandatory_keyword_arguments_one: :fill_me_in,
        # Predict: method_with_mandatory_keyword_arguments(two: 2, one: 1)
        mandatory_keyword_arguments_two: :fill_me_in,
        # Mandatory keyword arguments without mandatory argument.
        # exception = assert_raise(___) do
        # method_with_mandatory_keyword_arguments
        # end
        # assert_match(/__/, exception.message)
        # Predict: exception class from: method_with_mandatory_keyword_arguments
        mandatory_keyword_arguments_without_mandatory_argument_one: :fill_me_in,
        # Predict: exception.message
        mandatory_keyword_arguments_without_mandatory_argument_two: :fill_me_in
      }
    end
  end
end
