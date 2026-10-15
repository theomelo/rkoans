# frozen_string_literal: true

# SPDX-License-Identifier: CC-BY-NC-SA-3.0
# Adapted from Ruby Koans by Jim Weirich and Joe O'Brien.
# See THIRD_PARTY_NOTICES.md for attribution and license terms.

module Exercises
  # Predictions for methods examples.
  class AboutMethods
    # Returns reference predictions for the examples.
    # @return [Hash<Symbol, Object>]
    # This method is an answer table, not a sequence of operations.
    def self.koans # rubocop:disable Metrics/MethodLength
      {
        calling_global_methods_one: 5,
        calling_global_methods_without_parentheses_one: 5,
        sometimes_missing_parentheses_are_ambiguous_one: 5,
        calling_global_methods_with_wrong_number_of_arguments_one: ::ArgumentError,
        calling_global_methods_with_wrong_number_of_arguments_two: 'wrong number of arguments',
        calling_global_methods_with_wrong_number_of_arguments_three: ::ArgumentError,
        calling_global_methods_with_wrong_number_of_arguments_four: 'wrong number of arguments',
        calling_with_default_values_one: [1, :default_value],
        calling_with_default_values_two: [1, 2],
        calling_with_variable_arguments_one: ::Array,
        calling_with_variable_arguments_two: [],
        calling_with_variable_arguments_three: [:one],
        calling_with_variable_arguments_four: %i[one two],
        method_with_explicit_return_one: :return_value,
        method_without_explicit_return_one: :return_value,
        calling_methods_in_same_class_one: 12,
        calling_methods_in_same_class_with_explicit_receiver_one: 12,
        calling_private_methods_without_receiver_one: 'a secret',
        calling_private_methods_with_an_explicit_receiver_one: 'a secret',
        calling_methods_in_other_objects_require_explicit_receiver_one: 'Fido',
        calling_private_methods_in_other_objects_one: ::NoMethodError
      }
    end
  end
end
