# frozen_string_literal: true

# SPDX-License-Identifier: CC-BY-NC-SA-3.0
# Adapted from Ruby Koans by Jim Weirich and Joe O'Brien.
# See THIRD_PARTY_NOTICES.md for attribution and license terms.

module Exercises
  # Predictions for inheritance examples.
  class AboutInheritance
    # Replace each :fill_me_in with the result of the described expression.
    # @return [Hash<Symbol, Object>]
    # This method is an answer table, not a sequence of operations.
    def self.koans
      {
        # Subclasses have the parent as an ancestor.
        # assert_equal __, Chihuahua.ancestors.include?(Dog)
        # Predict: Chihuahua.ancestors.include?(Dog)
        subclasses_have_the_parent_as_an_ancestor_one: :fill_me_in,
        # All classes ultimately inherit from object.
        # assert_equal __, Chihuahua.ancestors.include?(Object)
        # Predict: Chihuahua.ancestors.include?(Object)
        all_classes_ultimately_inherit_from_object_one: :fill_me_in,
        # Subclasses inherit behavior from parent class.
        # chico = Chihuahua.new("Chico")
        # assert_equal __, chico.name
        # Predict: chico.name
        subclasses_inherit_behavior_from_parent_class_one: :fill_me_in,
        # Subclasses add new behavior.
        # chico = Chihuahua.new("Chico")
        # assert_equal __, chico.wag
        # assert_raise(___) do
        # fido = Dog.new("Fido")
        # fido.wag
        # end
        # Predict: chico.wag
        subclasses_add_new_behavior_one: :fill_me_in,
        # Predict: exception class from: fido = Dog.new("Fido");       fido.wag
        subclasses_add_new_behavior_two: :fill_me_in,
        # Subclasses can modify existing behavior.
        # chico = Chihuahua.new("Chico")
        # assert_equal __, chico.bark
        # fido = Dog.new("Fido")
        # assert_equal __, fido.bark
        # Predict: chico.bark
        subclasses_can_modify_existing_behavior_one: :fill_me_in,
        # Predict: fido.bark
        subclasses_can_modify_existing_behavior_two: :fill_me_in,
        # Subclasses can invoke parent behavior via super.
        # ralph = BullDog.new("Ralph")
        # assert_equal __, ralph.bark
        # Predict: ralph.bark
        subclasses_can_invoke_parent_behavior_via_super_one: :fill_me_in,
        # Super does not work cross method.
        # george = GreatDane.new("George")
        # assert_raise(___) do
        # george.growl
        # end
        # Predict: exception class from: george.growl
        super_does_not_work_cross_method_one: :fill_me_in
      }
    end
  end
end
