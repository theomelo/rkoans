# frozen_string_literal: true

# SPDX-License-Identifier: CC-BY-NC-SA-3.0
# Adapted from Ruby Koans by Jim Weirich and Joe O'Brien.
# See THIRD_PARTY_NOTICES.md for attribution and license terms.

module Exercises
  # Predictions for class methods examples.
  class AboutClassMethods
    # Replace each :fill_me_in with the result of the described expression.
    # @return [Hash<Symbol, Object>]
    # This method is an answer table, not a sequence of operations.
    def self.koans
      {
        # Objects are objects.
        # fido = Dog.new
        # assert_equal __, fido.is_a?(Object)
        # Predict: fido.is_a?(Object)
        objects_are_objects_one: :fill_me_in,
        # Classes are classes.
        # assert_equal __, Dog.is_a?(Class)
        # Predict: Dog.is_a?(Class)
        classes_are_classes_one: :fill_me_in,
        # Classes are objects too.
        # assert_equal __, Dog.is_a?(Object)
        # Predict: Dog.is_a?(Object)
        classes_are_objects_too_one: :fill_me_in,
        # Objects have methods.
        # fido = Dog.new
        # assert_equal __, fido.methods.any?
        # Predict: fido.methods.any?
        objects_have_methods_one: :fill_me_in,
        # Classes have methods.
        # assert_equal __, Dog.methods.any?
        # Predict: Dog.methods.any?
        classes_have_methods_one: :fill_me_in,
        # You can define methods on individual objects.
        # fido = Dog.new
        # def fido.wag
        # :fidos_wag
        # end
        # assert_equal __, fido.wag
        # Predict: fido.wag
        you_can_define_methods_on_individual_objects_one: :fill_me_in,
        # Other objects are not affected by these singleton methods.
        # fido = Dog.new
        # rover = Dog.new
        # def fido.wag
        # :fidos_wag
        # end
        # assert_raise(___) do
        # rover.wag
        # end
        # Predict: exception class from: rover.wag
        other_objects_are_not_affected_by_these_singleton_methods_one: :fill_me_in,
        # Since classes are objects you can define singleton methods on them too.
        # assert_equal __, Dog2.wag
        # Predict: Dog2.wag
        since_classes_are_objects_you_can_define_singleton_methods_on_them_too_one: :fill_me_in,
        # Class methods are independent of instance methods.
        # fido = Dog2.new
        # assert_equal __, fido.wag
        # assert_equal __, Dog2.wag
        # Predict: fido.wag
        class_methods_are_independent_of_instance_methods_one: :fill_me_in,
        # Predict: Dog2.wag
        class_methods_are_independent_of_instance_methods_two: :fill_me_in,
        # Classes and instances do not share instance variables.
        # fido = Dog.new
        # fido.name = "Fido"
        # assert_equal __, fido.name
        # assert_equal __, Dog.name
        # Predict: fido.name
        classes_and_instances_do_not_share_instance_variables_one: :fill_me_in,
        # Predict: Dog.name
        classes_and_instances_do_not_share_instance_variables_two: :fill_me_in,
        # You can define class methods inside the class.
        # assert_equal __, Dog.a_class_method
        # Predict: Dog.a_class_method
        you_can_define_class_methods_inside_the_class_one: :fill_me_in,
        # Class statements return the value of their last expression.
        # assert_equal __, LastExpressionInClassStatement
        # Predict: LastExpressionInClassStatement
        class_statements_return_the_value_of_their_last_expression_one: :fill_me_in,
        # Self while inside class is class object not instance.
        # assert_equal __, Dog == SelfInsideOfClassStatement
        # Predict: Dog == SelfInsideOfClassStatement
        self_while_inside_class_is_class_object_not_instance_one: :fill_me_in,
        # You can use self instead of an explicit reference to dog.
        # assert_equal __, Dog.class_method2
        # Predict: Dog.class_method2
        you_can_use_self_instead_of_an_explicit_reference_to_dog_one: :fill_me_in,
        # Heres still another way to write class methods.
        # assert_equal __, Dog.another_class_method
        # Predict: Dog.another_class_method
        heres_still_another_way_to_write_class_methods_one: :fill_me_in,
        # Heres an easy way to call class methods from instance methods.
        # fido = Dog.new
        # assert_equal __, fido.class.another_class_method
        # Predict: fido.class.another_class_method
        heres_an_easy_way_to_call_class_methods_from_instance_methods_one: :fill_me_in
      }
    end
  end
end
