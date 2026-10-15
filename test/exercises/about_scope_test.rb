# frozen_string_literal: true

# An empty class demonstrates construction without custom methods.
# Class identity comparisons explicitly demonstrate lexical constant lookup.
# rubocop:disable Lint/EmptyClass, Style/ClassEqualityComparison

# SPDX-License-Identifier: CC-BY-NC-SA-3.0
# Adapted from Ruby Koans by Jim Weirich and Joe O'Brien.
# See THIRD_PARTY_NOTICES.md for attribution and license terms.

require ARGV.shift
class AboutScopeTest < Minitest::Test
  module Jims
    class Dog
      # Demonstrates identify.
      def identify
        :jims_dog
      end
    end
  end

  module Joes
    class Dog
      # Demonstrates identify.
      def identify
        :joes_dog
      end
    end
  end

  # Checks dog is not available in the current scope.
  def test_dog_is_not_available_in_the_current_scope
    assert_predicted_error(:dog_is_not_available_in_the_current_scope_one, ::NameError) do
      Dog.new
    end
  end

  # Checks you can reference nested classes using the scope operator.
  def test_you_can_reference_nested_classes_using_the_scope_operator
    fido = Jims::Dog.new
    rover = Joes::Dog.new

    assert_equal Exercises::AboutScope.koans.fetch(:you_can_reference_nested_classes_using_the_scope_operator_one),
                 fido.identify
    assert_equal Exercises::AboutScope.koans.fetch(:you_can_reference_nested_classes_using_the_scope_operator_two),
                 rover.identify

    assert_equal Exercises::AboutScope.koans.fetch(:you_can_reference_nested_classes_using_the_scope_operator_three),
                 (fido.class != rover.class)
    assert_equal Exercises::AboutScope.koans.fetch(:you_can_reference_nested_classes_using_the_scope_operator_four),
                 (Jims::Dog != Joes::Dog)
  end

  # ------------------------------------------------------------------

  class String
  end

  # Checks bare bones class names assume the current scope.
  def test_bare_bones_class_names_assume_the_current_scope
    assert_equal Exercises::AboutScope.koans.fetch(:bare_bones_class_names_assume_the_current_scope_one),
                 (AboutScopeTest::String == String)
  end

  # Checks nested string is not the same as the system string.
  def test_nested_string_is_not_the_same_as_the_system_string
    assert_equal Exercises::AboutScope.koans.fetch(:nested_string_is_not_the_same_as_the_system_string_one),
                 ('HI'.class == String)
  end

  # Checks use the prefix scope operator to force the global scope.
  def test_use_the_prefix_scope_operator_to_force_the_global_scope
    assert_equal Exercises::AboutScope.koans.fetch(:use_the_prefix_scope_operator_to_force_the_global_scope_one),
                 ('HI'.class == ::String)
  end

  # ------------------------------------------------------------------

  PI = 3.1416

  # Checks constants are defined with an initial uppercase letter.
  def test_constants_are_defined_with_an_initial_uppercase_letter
    assert_equal Exercises::AboutScope.koans.fetch(:constants_are_defined_with_an_initial_uppercase_letter_one), PI
  end

  # ------------------------------------------------------------------

  MyString = ::String

  # Checks class names are just constants.
  def test_class_names_are_just_constants
    assert_equal Exercises::AboutScope.koans.fetch(:class_names_are_just_constants_one), (MyString == ::String)
    assert_equal Exercises::AboutScope.koans.fetch(:class_names_are_just_constants_two), ('HI'.class == MyString)
  end

  # Checks constants can be looked up explicitly.
  def test_constants_can_be_looked_up_explicitly
    assert_equal Exercises::AboutScope.koans.fetch(:constants_can_be_looked_up_explicitly_one),
                 (AboutScopeTest.const_get('PI') == PI)
    assert_equal Exercises::AboutScope.koans.fetch(:constants_can_be_looked_up_explicitly_two),
                 (AboutScopeTest.const_get('MyString') == MyString)
  end

  # Checks you can get a list of constants for any class or module.
  def test_you_can_get_a_list_of_constants_for_any_class_or_module
    assert_equal Exercises::AboutScope.koans.fetch(:you_can_get_a_list_of_constants_for_any_class_or_module_one),
                 Jims.constants
    assert_equal Exercises::AboutScope.koans.fetch(:you_can_get_a_list_of_constants_for_any_class_or_module_two),
                 Object.constants.any?
  end

  # Checks the predicted exception class while returning the captured error.
  # @param key [Symbol] answer field
  # @param klass [Class<Exception>] exception raised by the example
  # @return [Exception]
  def assert_predicted_error(key, ...)
    error = assert_raises(...)
    assert_equal Exercises::AboutScope.koans.fetch(key), error.class
    error
  end
end

# rubocop:enable Lint/EmptyClass, Style/ClassEqualityComparison
