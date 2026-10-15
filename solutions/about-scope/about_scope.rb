# frozen_string_literal: true

# SPDX-License-Identifier: CC-BY-NC-SA-3.0
# Adapted from Ruby Koans by Jim Weirich and Joe O'Brien.
# See THIRD_PARTY_NOTICES.md for attribution and license terms.

module Exercises
  # Predictions for scope examples.
  class AboutScope
    # Returns reference predictions for the examples.
    # @return [Hash<Symbol, Object>]
    # This method is an answer table, not a sequence of operations.
    def self.koans
      {
        dog_is_not_available_in_the_current_scope_one: ::NameError,
        you_can_reference_nested_classes_using_the_scope_operator_one: :jims_dog,
        you_can_reference_nested_classes_using_the_scope_operator_two: :joes_dog,
        you_can_reference_nested_classes_using_the_scope_operator_three: true,
        you_can_reference_nested_classes_using_the_scope_operator_four: true,
        bare_bones_class_names_assume_the_current_scope_one: true,
        nested_string_is_not_the_same_as_the_system_string_one: false,
        use_the_prefix_scope_operator_to_force_the_global_scope_one: true,
        constants_are_defined_with_an_initial_uppercase_letter_one: 3.1416,
        class_names_are_just_constants_one: true,
        class_names_are_just_constants_two: true,
        constants_can_be_looked_up_explicitly_one: true,
        constants_can_be_looked_up_explicitly_two: true,
        you_can_get_a_list_of_constants_for_any_class_or_module_one: [:Dog],
        you_can_get_a_list_of_constants_for_any_class_or_module_two: true
      }
    end
  end
end
