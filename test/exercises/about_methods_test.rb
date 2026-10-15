# frozen_string_literal: true

# The unreachable expression demonstrates the effect of explicit return.
# Non-returned expressions demonstrate method return behavior.
# Keep the related original chapter examples together.
# Short parameter names match the small arithmetic or assignment examples.
# The fixed literal expression is an isolated binding or syntax experiment.
# The explicit receiver is part of the method-call experiment.
# rubocop:disable Lint/UnreachableCode, Lint/Void, Metrics/ClassLength, Naming/MethodParameterName, Style/EvalWithLocation, Style/RedundantSelf

# SPDX-License-Identifier: CC-BY-NC-SA-3.0
# Adapted from Ruby Koans by Jim Weirich and Joe O'Brien.
# See THIRD_PARTY_NOTICES.md for attribution and license terms.

require ARGV.shift
# Demonstrates my global method.
def my_global_method(a, b)
  a + b
end

class AboutMethodsTest < Minitest::Test
  # Checks calling global methods.
  def test_calling_global_methods
    assert_equal Exercises::AboutMethods.koans.fetch(:calling_global_methods_one), my_global_method(2, 3)
  end

  # Checks calling global methods without parentheses.
  def test_calling_global_methods_without_parentheses
    result = my_global_method 2, 3

    assert_equal Exercises::AboutMethods.koans.fetch(:calling_global_methods_without_parentheses_one), result
  end

  # Parentheses make the inner call's argument list explicit.
  # Checks sometimes missing parentheses are ambiguous.
  def test_sometimes_missing_parentheses_are_ambiguous
    assert_equal Exercises::AboutMethods.koans.fetch(:sometimes_missing_parentheses_are_ambiguous_one),
                 eval('my_global_method(2, 3)')
  end

  # NOTE: wrong number of arguments is not a SYNTAX error, but a
  # runtime error.
  # Checks calling global methods with wrong number of arguments.
  def test_calling_global_methods_with_wrong_number_of_arguments
    exception = assert_predicted_error(:calling_global_methods_with_wrong_number_of_arguments_one, ::ArgumentError) do
      my_global_method
    end
    assert_predicted_message(:calling_global_methods_with_wrong_number_of_arguments_two, exception.message)

    exception = assert_predicted_error(:calling_global_methods_with_wrong_number_of_arguments_three, ::ArgumentError) do
      my_global_method(1, 2, 3)
    end
    assert_predicted_message(:calling_global_methods_with_wrong_number_of_arguments_four, exception.message)
  end

  # ------------------------------------------------------------------

  # Demonstrates method with defaults.
  def method_with_defaults(a, b = :default_value)
    [a, b]
  end

  # Checks calling with default values.
  def test_calling_with_default_values
    assert_equal Exercises::AboutMethods.koans.fetch(:calling_with_default_values_one), method_with_defaults(1)
    assert_equal Exercises::AboutMethods.koans.fetch(:calling_with_default_values_two), method_with_defaults(1, 2)
  end

  # ------------------------------------------------------------------

  # Demonstrates method with var args.
  def method_with_var_args(*args)
    args
  end

  # Checks calling with variable arguments.
  def test_calling_with_variable_arguments
    assert_equal Exercises::AboutMethods.koans.fetch(:calling_with_variable_arguments_one), method_with_var_args.class
    assert_equal Exercises::AboutMethods.koans.fetch(:calling_with_variable_arguments_two), method_with_var_args
    assert_equal Exercises::AboutMethods.koans.fetch(:calling_with_variable_arguments_three),
                 method_with_var_args(:one)
    assert_equal Exercises::AboutMethods.koans.fetch(:calling_with_variable_arguments_four),
                 method_with_var_args(:one, :two)
  end

  # ------------------------------------------------------------------

  # Demonstrates method with explicit return.
  def method_with_explicit_return
    :a_non_return_value
    return :return_value
    :another_non_return_value
  end

  # Checks method with explicit return.
  def test_method_with_explicit_return
    assert_equal Exercises::AboutMethods.koans.fetch(:method_with_explicit_return_one), method_with_explicit_return
  end

  # ------------------------------------------------------------------

  # Demonstrates method without explicit return.
  def method_without_explicit_return
    :a_non_return_value
    :return_value
  end

  # Checks method without explicit return.
  def test_method_without_explicit_return
    assert_equal Exercises::AboutMethods.koans.fetch(:method_without_explicit_return_one),
                 method_without_explicit_return
  end

  # ------------------------------------------------------------------

  # Demonstrates my method in the same class.
  def my_method_in_the_same_class(a, b)
    a * b
  end

  # Checks calling methods in same class.
  def test_calling_methods_in_same_class
    assert_equal Exercises::AboutMethods.koans.fetch(:calling_methods_in_same_class_one),
                 my_method_in_the_same_class(3, 4)
  end

  # Checks calling methods in same class with explicit receiver.
  def test_calling_methods_in_same_class_with_explicit_receiver
    assert_equal Exercises::AboutMethods.koans.fetch(:calling_methods_in_same_class_with_explicit_receiver_one),
                 self.my_method_in_the_same_class(3, 4)
  end

  # ------------------------------------------------------------------

  # Demonstrates my private method.
  def my_private_method
    'a secret'
  end
  private :my_private_method

  # Checks calling private methods without receiver.
  def test_calling_private_methods_without_receiver
    assert_equal Exercises::AboutMethods.koans.fetch(:calling_private_methods_without_receiver_one), my_private_method
  end

  # Modern Ruby permits self as the receiver of a private method.
  # Checks calling private methods with an explicit receiver.
  def test_calling_private_methods_with_an_explicit_receiver
    assert_equal Exercises::AboutMethods.koans.fetch(:calling_private_methods_with_an_explicit_receiver_one),
                 self.my_private_method
  end

  # ------------------------------------------------------------------

  class Dog
    # Demonstrates name.
    def name
      'Fido'
    end

    private

    # Demonstrates tail.
    def tail
      'tail'
    end
  end

  # Checks calling methods in other objects require explicit receiver.
  def test_calling_methods_in_other_objects_require_explicit_receiver
    rover = Dog.new

    assert_equal Exercises::AboutMethods.koans.fetch(:calling_methods_in_other_objects_require_explicit_receiver_one),
                 rover.name
  end

  # Checks calling private methods in other objects.
  def test_calling_private_methods_in_other_objects
    rover = Dog.new
    assert_predicted_error(:calling_private_methods_in_other_objects_one, ::NoMethodError) do
      rover.tail
    end
  end

  # Checks the predicted exception class while returning the captured error.
  # @param key [Symbol] answer field
  # @param klass [Class<Exception>] exception raised by the example
  # @return [Exception]
  def assert_predicted_error(key, ...)
    error = assert_raises(...)
    assert_equal Exercises::AboutMethods.koans.fetch(key), error.class
    error
  end

  # Checks a nonempty literal fragment without depending on full diagnostic formatting.
  # @param key [Symbol] answer field
  # @param message [String] observed exception message
  # @return [void]
  def assert_predicted_message(key, message)
    fragment = Exercises::AboutMethods.koans.fetch(key)

    assert_kind_of String, fragment
    refute_empty fragment
    assert_includes message, fragment
  end
end

# rubocop:enable Lint/UnreachableCode, Lint/Void, Metrics/ClassLength, Naming/MethodParameterName, Style/EvalWithLocation, Style/RedundantSelf
