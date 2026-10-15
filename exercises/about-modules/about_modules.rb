# frozen_string_literal: true

# SPDX-License-Identifier: CC-BY-NC-SA-3.0
# Adapted from Ruby Koans by Jim Weirich and Joe O'Brien.
# See THIRD_PARTY_NOTICES.md for attribution and license terms.

module Exercises
  # Predictions for modules examples.
  class AboutModules
    # Replace each :fill_me_in with the result of the described expression.
    # @return [Hash<Symbol, Object>]
    # This method is an answer table, not a sequence of operations.
    def self.koans
      {
        # Cant instantiate modules.
        # assert_raise(___) do
        # Nameable.new
        # end
        # Predict: exception class from: Nameable.new
        cant_instantiate_modules_one: :fill_me_in,
        # Normal methods are available in the object.
        # fido = Dog.new
        # assert_equal __, fido.bark
        # Predict: fido.bark
        normal_methods_are_available_in_the_object_one: :fill_me_in,
        # Module methods can affect instance variables in the object.
        # fido = Dog.new
        # assert_equal __, fido.name
        # fido.set_name("Rover")
        # assert_equal __, fido.name
        # Predict: fido.name
        module_methods_can_affect_instance_variables_in_the_object_one: :fill_me_in,
        # Predict: fido.name
        module_methods_can_affect_instance_variables_in_the_object_two: :fill_me_in,
        # Classes can override module methods.
        # fido = Dog.new
        # assert_equal __, fido.here
        # Predict: fido.here
        classes_can_override_module_methods_one: :fill_me_in
      }
    end
  end
end
