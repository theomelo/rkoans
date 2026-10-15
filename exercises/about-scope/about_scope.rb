# frozen_string_literal: true

# SPDX-License-Identifier: CC-BY-NC-SA-3.0
# Adapted from Ruby Koans by Jim Weirich and Joe O'Brien.
# See THIRD_PARTY_NOTICES.md for attribution and license terms.

module Exercises
  # Predictions for scope examples.
  class AboutScope
    # Replace each :fill_me_in with the result of the described expression.
    # @return [Hash<Symbol, Object>]
    # This method is an answer table, not a sequence of operations.
    def self.koans
      {
        # Dog is not available in the current scope.
        # assert_raise(___) do
        # Dog.new
        # end
        # Predict: exception class from: Dog.new
        dog_is_not_available_in_the_current_scope_one: :fill_me_in,
        # You can reference nested classes using the scope operator.
        # fido = Jims::Dog.new
        # rover = Joes::Dog.new
        # assert_equal __, fido.identify
        # assert_equal __, rover.identify
        # assert_equal __, fido.class != rover.class
        # assert_equal __, Jims::Dog != Joes::Dog
        # Predict: fido.identify
        you_can_reference_nested_classes_using_the_scope_operator_one: :fill_me_in,
        # Predict: rover.identify
        you_can_reference_nested_classes_using_the_scope_operator_two: :fill_me_in,
        # Predict: fido.class != rover.class
        you_can_reference_nested_classes_using_the_scope_operator_three: :fill_me_in,
        # Predict: Jims::Dog != Joes::Dog
        you_can_reference_nested_classes_using_the_scope_operator_four: :fill_me_in,
        # Bare bones class names assume the current scope.
        # assert_equal __, AboutScopeTest::String == String
        # Predict: AboutScopeTest::String == String
        bare_bones_class_names_assume_the_current_scope_one: :fill_me_in,
        # Nested string is not the same as the system string.
        # assert_equal __, String == "HI".class
        # Predict: String == "HI".class
        nested_string_is_not_the_same_as_the_system_string_one: :fill_me_in,
        # Use the prefix scope operator to force the global scope.
        # assert_equal __, ::String == "HI".class
        # Predict: ::String == "HI".class
        use_the_prefix_scope_operator_to_force_the_global_scope_one: :fill_me_in,
        # Constants are defined with an initial uppercase letter.
        # assert_equal __, PI
        # Predict: PI
        constants_are_defined_with_an_initial_uppercase_letter_one: :fill_me_in,
        # Class names are just constants.
        # assert_equal __, MyString == ::String
        # assert_equal __, MyString == "HI".class
        # Predict: MyString == ::String
        class_names_are_just_constants_one: :fill_me_in,
        # Predict: MyString == "HI".class
        class_names_are_just_constants_two: :fill_me_in,
        # Constants can be looked up explicitly.
        # assert_equal __, PI == AboutScopeTest.const_get("PI")
        # assert_equal __, MyString == AboutScopeTest.const_get("MyString")
        # Predict: PI == AboutScopeTest.const_get("PI")
        constants_can_be_looked_up_explicitly_one: :fill_me_in,
        # Predict: MyString == AboutScopeTest.const_get("MyString")
        constants_can_be_looked_up_explicitly_two: :fill_me_in,
        # You can get a list of constants for any class or module.
        # assert_equal __, Jims.constants
        # assert_equal __, Object.constants.any?
        # Predict: Jims.constants
        you_can_get_a_list_of_constants_for_any_class_or_module_one: :fill_me_in,
        # Predict: Object.constants.any?
        you_can_get_a_list_of_constants_for_any_class_or_module_two: :fill_me_in
      }
    end
  end
end
