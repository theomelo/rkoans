# frozen_string_literal: true

# SPDX-License-Identifier: CC-BY-NC-SA-3.0
# Adapted from Ruby Koans by Jim Weirich and Joe O'Brien.
# See THIRD_PARTY_NOTICES.md for attribution and license terms.

module Exercises
  # Predictions for class methods examples.
  class AboutClassMethods
    # Returns reference predictions for the examples.
    # @return [Hash<Symbol, Object>]
    # This method is an answer table, not a sequence of operations.
    def self.koans
      {
        objects_are_objects_one: true,
        classes_are_classes_one: true,
        classes_are_objects_too_one: true,
        objects_have_methods_one: true,
        classes_have_methods_one: true,
        you_can_define_methods_on_individual_objects_one: :fidos_wag,
        other_objects_are_not_affected_by_these_singleton_methods_one: ::NoMethodError,
        since_classes_are_objects_you_can_define_singleton_methods_on_them_too_one: :class_level_wag,
        class_methods_are_independent_of_instance_methods_one: :instance_level_wag,
        class_methods_are_independent_of_instance_methods_two: :class_level_wag,
        classes_and_instances_do_not_share_instance_variables_one: 'Fido',
        classes_and_instances_do_not_share_instance_variables_two: nil,
        you_can_define_class_methods_inside_the_class_one: :dogs_class_method,
        class_statements_return_the_value_of_their_last_expression_one: 21,
        self_while_inside_class_is_class_object_not_instance_one: true,
        you_can_use_self_instead_of_an_explicit_reference_to_dog_one: :another_way_to_write_class_methods,
        heres_still_another_way_to_write_class_methods_one: :still_another_way,
        heres_an_easy_way_to_call_class_methods_from_instance_methods_one: :still_another_way
      }
    end
  end
end
