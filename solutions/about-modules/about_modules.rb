# frozen_string_literal: true

# SPDX-License-Identifier: CC-BY-NC-SA-3.0
# Adapted from Ruby Koans by Jim Weirich and Joe O'Brien.
# See THIRD_PARTY_NOTICES.md for attribution and license terms.

module Exercises
  # Predictions for modules examples.
  class AboutModules
    # Returns reference predictions for the examples.
    # @return [Hash<Symbol, Object>]
    # This method is an answer table, not a sequence of operations.
    def self.koans
      {
        cant_instantiate_modules_one: ::NoMethodError,
        normal_methods_are_available_in_the_object_one: 'WOOF',
        module_methods_can_affect_instance_variables_in_the_object_one: 'Fido',
        module_methods_can_affect_instance_variables_in_the_object_two: 'Rover',
        classes_can_override_module_methods_one: :in_object
      }
    end
  end
end
