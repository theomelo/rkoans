# frozen_string_literal: true

# SPDX-License-Identifier: CC-BY-NC-SA-3.0
# Adapted from Ruby Koans by Jim Weirich and Joe O'Brien.
# See THIRD_PARTY_NOTICES.md for attribution and license terms.

module Exercises
  # Predictions for methods examples.
  class AboutMethods
    # Replace each :fill_me_in with the result of the described expression.
    # @return [Hash<Symbol, Object>]
    # This method is an answer table, not a sequence of operations.
    def self.koans # rubocop:disable Metrics/MethodLength
      {
        # Calling global methods.
        # assert_equal __, my_global_method(2,3)
        # Predict: my_global_method(2,3)
        calling_global_methods_one: :fill_me_in,
        # Calling global methods without parentheses.
        # result = my_global_method 2, 3
        # assert_equal __, result
        # Predict: result
        calling_global_methods_without_parentheses_one: :fill_me_in,
        # Sometimes missing parentheses are ambiguous.
        # assert_equal __, eval("my_global_method(2, 3)")
        # Predict: eval("my_global_method(2, 3)")
        sometimes_missing_parentheses_are_ambiguous_one: :fill_me_in,
        # Calling global methods with wrong number of arguments.
        # exception = assert_raise(___) do
        # my_global_method
        # end
        # assert_match(/__/, exception.message)
        # exception = assert_raise(___) do
        # my_global_method(1,2,3)
        # end
        # assert_match(/__/, exception.message)
        # Predict: exception class from: my_global_method
        calling_global_methods_with_wrong_number_of_arguments_one: :fill_me_in,
        # Predict: exception.message
        calling_global_methods_with_wrong_number_of_arguments_two: :fill_me_in,
        # Predict: exception class from: my_global_method(1,2,3)
        calling_global_methods_with_wrong_number_of_arguments_three: :fill_me_in,
        # Predict: exception.message
        calling_global_methods_with_wrong_number_of_arguments_four: :fill_me_in,
        # Calling with default values.
        # assert_equal [1, __], method_with_defaults(1)
        # assert_equal [1, __], method_with_defaults(1, 2)
        # Predict: method_with_defaults(1)
        calling_with_default_values_one: :fill_me_in,
        # Predict: method_with_defaults(1, 2)
        calling_with_default_values_two: :fill_me_in,
        # Calling with variable arguments.
        # assert_equal __, method_with_var_args.class
        # assert_equal __, method_with_var_args
        # assert_equal __, method_with_var_args(:one)
        # assert_equal __, method_with_var_args(:one, :two)
        # Predict: method_with_var_args.class
        calling_with_variable_arguments_one: :fill_me_in,
        # Predict: method_with_var_args
        calling_with_variable_arguments_two: :fill_me_in,
        # Predict: method_with_var_args(:one)
        calling_with_variable_arguments_three: :fill_me_in,
        # Predict: method_with_var_args(:one, :two)
        calling_with_variable_arguments_four: :fill_me_in,
        # Method with explicit return.
        # assert_equal __, method_with_explicit_return
        # Predict: method_with_explicit_return
        method_with_explicit_return_one: :fill_me_in,
        # Method without explicit return.
        # assert_equal __, method_without_explicit_return
        # Predict: method_without_explicit_return
        method_without_explicit_return_one: :fill_me_in,
        # Calling methods in same class.
        # assert_equal __, my_method_in_the_same_class(3,4)
        # Predict: my_method_in_the_same_class(3,4)
        calling_methods_in_same_class_one: :fill_me_in,
        # Calling methods in same class with explicit receiver.
        # assert_equal __, self.my_method_in_the_same_class(3,4)
        # Predict: self.my_method_in_the_same_class(3,4)
        calling_methods_in_same_class_with_explicit_receiver_one: :fill_me_in,
        # Calling private methods without receiver.
        # assert_equal __, my_private_method
        # Predict: my_private_method
        calling_private_methods_without_receiver_one: :fill_me_in,
        # Calling private methods with an explicit receiver.
        # assert_equal __, self.my_private_method
        # Predict: self.my_private_method
        calling_private_methods_with_an_explicit_receiver_one: :fill_me_in,
        # Calling methods in other objects require explicit receiver.
        # rover = Dog.new
        # assert_equal __, rover.name
        # Predict: rover.name
        calling_methods_in_other_objects_require_explicit_receiver_one: :fill_me_in,
        # Calling private methods in other objects.
        # rover = Dog.new
        # assert_raise(___) do
        # rover.tail
        # end
        # Predict: exception class from: rover.tail
        calling_private_methods_in_other_objects_one: :fill_me_in
      }
    end
  end
end
