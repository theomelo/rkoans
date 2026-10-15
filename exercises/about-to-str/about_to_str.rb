# frozen_string_literal: true

# SPDX-License-Identifier: CC-BY-NC-SA-3.0
# Adapted from Ruby Koans by Jim Weirich and Joe O'Brien.
# See THIRD_PARTY_NOTICES.md for attribution and license terms.

module Exercises
  # Predictions for to str examples.
  class AboutToStr
    # Replace each :fill_me_in with the result of the described expression.
    # @return [Hash<Symbol, Object>]
    # This method is an answer table, not a sequence of operations.
    def self.koans
      {
        # To s returns a string representation.
        # not_like_a_string = CanNotBeTreatedAsString.new
        # assert_equal __, not_like_a_string.to_s
        # Predict: not_like_a_string.to_s
        to_s_returns_a_string_representation_one: :fill_me_in,
        # Normally objects cannot be used where strings are expected.
        # assert_raise(___) do
        # File.exist?(CanNotBeTreatedAsString.new)
        # end
        # Predict: exception class from: File.exist?(CanNotBeTreatedAsString.new)
        normally_objects_cannot_be_used_where_strings_are_expected_one: :fill_me_in,
        # To str also returns a string representation.
        # like_a_string = CanBeTreatedAsString.new
        # assert_equal __, like_a_string.to_str
        # Predict: like_a_string.to_str
        to_str_also_returns_a_string_representation_one: :fill_me_in,
        # To str allows objects to be treated as strings.
        # Dir.mktmpdir do |directory|
        # Dir.chdir(directory) do
        # assert_equal __, File.exist?(CanBeTreatedAsString.new)
        # end
        # end
        # Predict: File.exist?(CanBeTreatedAsString.new)
        to_str_allows_objects_to_be_treated_as_strings_one: :fill_me_in,
        # User defined code can check for to str.
        # assert_equal __, acts_like_a_string?(CanNotBeTreatedAsString.new)
        # assert_equal __,  acts_like_a_string?(CanBeTreatedAsString.new)
        # Predict: acts_like_a_string?(CanNotBeTreatedAsString.new)
        user_defined_code_can_check_for_to_str_one: :fill_me_in,
        # Predict: acts_like_a_string?(CanBeTreatedAsString.new)
        user_defined_code_can_check_for_to_str_two: :fill_me_in
      }
    end
  end
end
