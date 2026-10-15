# frozen_string_literal: true

# SPDX-License-Identifier: CC-BY-NC-SA-3.0
# Adapted from Ruby Koans by Jim Weirich and Joe O'Brien.
# See THIRD_PARTY_NOTICES.md for attribution and license terms.

module Exercises
  # Predictions for inheritance examples.
  class AboutInheritance
    # Returns reference predictions for the examples.
    # @return [Hash<Symbol, Object>]
    # This method is an answer table, not a sequence of operations.
    def self.koans
      {
        subclasses_have_the_parent_as_an_ancestor_one: true,
        all_classes_ultimately_inherit_from_object_one: true,
        subclasses_inherit_behavior_from_parent_class_one: 'Chico',
        subclasses_add_new_behavior_one: :happy,
        subclasses_add_new_behavior_two: ::NoMethodError,
        subclasses_can_modify_existing_behavior_one: 'yip',
        subclasses_can_modify_existing_behavior_two: 'WOOF',
        subclasses_can_invoke_parent_behavior_via_super_one: 'WOOF, GROWL',
        super_does_not_work_cross_method_one: ::NoMethodError
      }
    end
  end
end
