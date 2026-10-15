# frozen_string_literal: true

# SPDX-License-Identifier: CC-BY-NC-SA-3.0
# Adapted from Ruby Koans by Jim Weirich and Joe O'Brien.
# See THIRD_PARTY_NOTICES.md for attribution and license terms.

module Exercises
  # Predictions for classes examples.
  class AboutClasses
    # Returns reference predictions for the examples.
    # @return [Hash<Symbol, Object>]
    # This method is an answer table, not a sequence of operations.
    def self.koans # rubocop:disable Metrics/MethodLength
      {
        instances_of_classes_can_be_created_with_new_one: ::AboutClassesTest::Dog,
        instance_variables_can_be_set_by_assigning_to_them_one: [],
        instance_variables_can_be_set_by_assigning_to_them_two: [:@name],
        instance_variables_cannot_be_accessed_outside_the_class_one: ::NoMethodError,
        instance_variables_cannot_be_accessed_outside_the_class_two: ::SyntaxError,
        you_can_politely_ask_for_instance_variable_values_one: 'Fido',
        you_can_rip_the_value_out_using_instance_eval_one: 'Fido',
        you_can_rip_the_value_out_using_instance_eval_two: 'Fido',
        you_can_create_accessor_methods_to_return_instance_variables_one: 'Fido',
        attr_reader_will_automatically_define_an_accessor_one: 'Fido',
        attr_accessor_will_automatically_define_both_read_and_write_accessors_one: 'Fido',
        initialize_provides_initial_values_for_instance_variables_one: 'Fido',
        args_to_new_must_match_initialize_one: ::ArgumentError,
        different_objects_have_different_instance_variables_one: true,
        inside_a_method_self_refers_to_the_containing_object_one: true,
        to_s_provides_a_string_version_of_the_object_one: 'Fido',
        to_s_is_used_in_string_interpolation_one: 'My dog is Fido',
        inspect_provides_a_more_complete_string_version_one: "<Dog named 'Fido'>",
        all_objects_support_to_s_and_inspect_one: '[1, 2, 3]',
        all_objects_support_to_s_and_inspect_two: '[1, 2, 3]',
        all_objects_support_to_s_and_inspect_three: 'STRING',
        all_objects_support_to_s_and_inspect_four: '"STRING"'
      }
    end
  end
end
