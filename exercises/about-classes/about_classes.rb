# frozen_string_literal: true

# SPDX-License-Identifier: CC-BY-NC-SA-3.0
# Adapted from Ruby Koans by Jim Weirich and Joe O'Brien.
# See THIRD_PARTY_NOTICES.md for attribution and license terms.

module Exercises
  # Predictions for classes examples.
  class AboutClasses
    # Replace each :fill_me_in with the result of the described expression.
    # @return [Hash<Symbol, Object>]
    # This method is an answer table, not a sequence of operations.
    def self.koans # rubocop:disable Metrics/MethodLength
      {
        # Instances of classes can be created with new.
        # fido = Dog.new
        # assert_equal __, fido.class
        # Predict: fido.class
        instances_of_classes_can_be_created_with_new_one: :fill_me_in,
        # Instance variables can be set by assigning to them.
        # fido = Dog2.new
        # assert_equal __, fido.instance_variables
        # fido.set_name("Fido")
        # assert_equal __, fido.instance_variables
        # Predict: fido.instance_variables
        instance_variables_can_be_set_by_assigning_to_them_one: :fill_me_in,
        # Predict: fido.instance_variables
        instance_variables_can_be_set_by_assigning_to_them_two: :fill_me_in,
        # Instance variables cannot be accessed outside the class.
        # fido = Dog2.new
        # fido.set_name("Fido")
        # assert_raise(___) do
        # fido.name
        # end
        # assert_raise(___) do
        # eval "fido.@name"
        # NOTE: Using eval because the above line is a syntax error.
        # end
        # Predict: exception class from: fido.name
        instance_variables_cannot_be_accessed_outside_the_class_one: :fill_me_in,
        # Predict: exception class from: eval "fido.@name"
        instance_variables_cannot_be_accessed_outside_the_class_two: :fill_me_in,
        # You can politely ask for instance variable values.
        # fido = Dog2.new
        # fido.set_name("Fido")
        # assert_equal __, fido.instance_variable_get("@name")
        # Predict: fido.instance_variable_get("@name")
        you_can_politely_ask_for_instance_variable_values_one: :fill_me_in,
        # You can rip the value out using instance eval.
        # fido = Dog2.new
        # fido.set_name("Fido")
        # assert_equal __, fido.instance_eval("@name")  # string version
        # assert_equal __, fido.instance_eval { @name }
        # Predict: fido.instance_eval("@name")
        you_can_rip_the_value_out_using_instance_eval_one: :fill_me_in,
        # Predict: fido.instance_eval { @name }
        you_can_rip_the_value_out_using_instance_eval_two: :fill_me_in,
        # You can create accessor methods to return instance variables.
        # fido = Dog3.new
        # fido.set_name("Fido")
        # assert_equal __, fido.name
        # Predict: fido.name
        you_can_create_accessor_methods_to_return_instance_variables_one: :fill_me_in,
        # Attr reader will automatically define an accessor.
        # fido = Dog4.new
        # fido.set_name("Fido")
        # assert_equal __, fido.name
        # Predict: fido.name
        attr_reader_will_automatically_define_an_accessor_one: :fill_me_in,
        # Attr accessor will automatically define both read and write accessors.
        # fido = Dog5.new
        # fido.name = "Fido"
        # assert_equal __, fido.name
        # Predict: fido.name
        attr_accessor_will_automatically_define_both_read_and_write_accessors_one: :fill_me_in,
        # Initialize provides initial values for instance variables.
        # fido = Dog6.new("Fido")
        # assert_equal __, fido.name
        # Predict: fido.name
        initialize_provides_initial_values_for_instance_variables_one: :fill_me_in,
        # Args to new must match initialize.
        # assert_raise(___) do
        # Dog6.new
        # end
        # Predict: exception class from: Dog6.new
        args_to_new_must_match_initialize_one: :fill_me_in,
        # Different objects have different instance variables.
        # fido = Dog6.new("Fido")
        # rover = Dog6.new("Rover")
        # assert_equal __, rover.name != fido.name
        # Predict: rover.name != fido.name
        different_objects_have_different_instance_variables_one: :fill_me_in,
        # Inside a method self refers to the containing object.
        # fido = Dog7.new("Fido")
        # fidos_self = fido.get_self
        # assert_equal __, fidos_self.equal?(fido)
        # Predict: fidos_self.equal?(fido)
        inside_a_method_self_refers_to_the_containing_object_one: :fill_me_in,
        # To s provides a string version of the object.
        # fido = Dog7.new("Fido")
        # assert_equal __, fido.to_s
        # Predict: fido.to_s
        to_s_provides_a_string_version_of_the_object_one: :fill_me_in,
        # To s is used in string interpolation.
        # fido = Dog7.new("Fido")
        # assert_equal __, "My dog is #{fido}"
        # Predict: "My dog is #{fido}"
        to_s_is_used_in_string_interpolation_one: :fill_me_in,
        # Inspect provides a more complete string version.
        # fido = Dog7.new("Fido")
        # assert_equal __, fido.inspect
        # Predict: fido.inspect
        inspect_provides_a_more_complete_string_version_one: :fill_me_in,
        # All objects support to s and inspect.
        # array = [1,2,3]
        # assert_equal __, array.to_s
        # assert_equal __, array.inspect
        # assert_equal __, "STRING".to_s
        # assert_equal __, "STRING".inspect
        # Predict: array.to_s
        all_objects_support_to_s_and_inspect_one: :fill_me_in,
        # Predict: array.inspect
        all_objects_support_to_s_and_inspect_two: :fill_me_in,
        # Predict: "STRING".to_s
        all_objects_support_to_s_and_inspect_three: :fill_me_in,
        # Predict: "STRING".inspect
        all_objects_support_to_s_and_inspect_four: :fill_me_in
      }
    end
  end
end
