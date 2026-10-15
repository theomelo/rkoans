# frozen_string_literal: true

# An empty class demonstrates construction without custom methods.
# These original names demonstrate constants and class objects.
# The lesson contrasts explicit class receivers with self and singleton-class syntax.
# Explicit getter definitions are compared with attr_reader and attr_accessor.
# rubocop:disable Lint/EmptyClass, Naming/ConstantName, Style/ClassMethods, Style/TrivialAccessors

# SPDX-License-Identifier: CC-BY-NC-SA-3.0
# Adapted from Ruby Koans by Jim Weirich and Joe O'Brien.
# See THIRD_PARTY_NOTICES.md for attribution and license terms.

require ARGV.shift
class AboutClassMethodsTest < Minitest::Test
  class Dog
  end

  # Checks objects are objects.
  def test_objects_are_objects
    fido = Dog.new

    assert_equal Exercises::AboutClassMethods.koans.fetch(:objects_are_objects_one), fido.is_a?(Object)
  end

  # Checks classes are classes.
  def test_classes_are_classes
    assert_equal Exercises::AboutClassMethods.koans.fetch(:classes_are_classes_one), Dog.is_a?(Class)
  end

  # Checks classes are objects too.
  def test_classes_are_objects_too
    assert_equal Exercises::AboutClassMethods.koans.fetch(:classes_are_objects_too_one), Dog.is_a?(Object)
  end

  # Checks objects have methods.
  def test_objects_have_methods
    fido = Dog.new

    assert_equal Exercises::AboutClassMethods.koans.fetch(:objects_have_methods_one), fido.methods.any?
  end

  # Checks classes have methods.
  def test_classes_have_methods
    assert_equal Exercises::AboutClassMethods.koans.fetch(:classes_have_methods_one), Dog.methods.any?
  end

  # Checks you can define methods on individual objects.
  def test_you_can_define_methods_on_individual_objects
    fido = Dog.new
    # Demonstrates fido.wag.
    def fido.wag
      :fidos_wag
    end

    assert_equal Exercises::AboutClassMethods.koans.fetch(:you_can_define_methods_on_individual_objects_one), fido.wag
  end

  # Checks other objects are not affected by these singleton methods.
  def test_other_objects_are_not_affected_by_these_singleton_methods
    fido = Dog.new
    rover = Dog.new
    # Demonstrates fido.wag.
    def fido.wag
      :fidos_wag
    end

    assert_predicted_error(:other_objects_are_not_affected_by_these_singleton_methods_one, ::NoMethodError) do
      rover.wag
    end
  end

  # ------------------------------------------------------------------

  class Dog2
    # Demonstrates wag.
    def wag
      :instance_level_wag
    end
  end

  # Demonstrates Dog2.wag.
  def Dog2.wag
    :class_level_wag
  end

  # Checks since classes are objects you can define singleton methods on them too.
  def test_since_classes_are_objects_you_can_define_singleton_methods_on_them_too
    assert_equal Exercises::AboutClassMethods.koans.fetch(:since_classes_are_objects_you_can_define_singleton_methods_on_them_too_one),
                 Dog2.wag
  end

  # Checks class methods are independent of instance methods.
  def test_class_methods_are_independent_of_instance_methods
    fido = Dog2.new

    assert_equal Exercises::AboutClassMethods.koans.fetch(:class_methods_are_independent_of_instance_methods_one),
                 fido.wag
    assert_equal Exercises::AboutClassMethods.koans.fetch(:class_methods_are_independent_of_instance_methods_two),
                 Dog2.wag
  end

  # ------------------------------------------------------------------

  class Dog
    attr_accessor :name
  end

  # Demonstrates Dog.name.
  def Dog.name
    @name
  end

  # Checks classes and instances do not share instance variables.
  def test_classes_and_instances_do_not_share_instance_variables
    fido = Dog.new
    fido.name = 'Fido'

    assert_equal Exercises::AboutClassMethods.koans.fetch(:classes_and_instances_do_not_share_instance_variables_one),
                 fido.name
    assert_equal Exercises::AboutClassMethods.koans.fetch(:classes_and_instances_do_not_share_instance_variables_two),
                 Dog.name
  end

  # ------------------------------------------------------------------

  class Dog
    # Demonstrates Dog.a class method.
    def Dog.a_class_method
      :dogs_class_method
    end
  end

  # Checks you can define class methods inside the class.
  def test_you_can_define_class_methods_inside_the_class
    assert_equal Exercises::AboutClassMethods.koans.fetch(:you_can_define_class_methods_inside_the_class_one),
                 Dog.a_class_method
  end

  # ------------------------------------------------------------------

  LastExpressionInClassStatement = class Dog
                                     21
                                   end

  # Checks class statements return the value of their last expression.
  def test_class_statements_return_the_value_of_their_last_expression
    assert_equal Exercises::AboutClassMethods.koans.fetch(:class_statements_return_the_value_of_their_last_expression_one),
                 LastExpressionInClassStatement
  end

  # ------------------------------------------------------------------

  SelfInsideOfClassStatement = class Dog
                                 self
                               end

  # Checks self while inside class is class object not instance.
  def test_self_while_inside_class_is_class_object_not_instance
    assert_equal Exercises::AboutClassMethods.koans.fetch(:self_while_inside_class_is_class_object_not_instance_one),
                 (Dog == SelfInsideOfClassStatement)
  end

  # ------------------------------------------------------------------

  class Dog
    # Demonstrates self.class method2.
    def self.class_method2
      :another_way_to_write_class_methods
    end
  end

  # Checks you can use self instead of an explicit reference to dog.
  def test_you_can_use_self_instead_of_an_explicit_reference_to_dog
    assert_equal Exercises::AboutClassMethods.koans.fetch(:you_can_use_self_instead_of_an_explicit_reference_to_dog_one),
                 Dog.class_method2
  end

  # ------------------------------------------------------------------

  class Dog
    class << self
      # Demonstrates another class method.
      def another_class_method
        :still_another_way
      end
    end
  end

  # Checks heres still another way to write class methods.
  def test_heres_still_another_way_to_write_class_methods
    assert_equal Exercises::AboutClassMethods.koans.fetch(:heres_still_another_way_to_write_class_methods_one),
                 Dog.another_class_method
  end

  # THINK ABOUT IT:
  #
  # The two major ways to write class methods are:
  #   class Demo
  #     def self.method
  #     end
  #
  #     class << self
  #       def class_methods
  #       end
  #     end
  #   end
  #
  # Which do you prefer and why?
  # Are there times you might prefer one over the other?

  # ------------------------------------------------------------------

  # Checks heres an easy way to call class methods from instance methods.
  def test_heres_an_easy_way_to_call_class_methods_from_instance_methods
    fido = Dog.new

    assert_equal Exercises::AboutClassMethods.koans.fetch(:heres_an_easy_way_to_call_class_methods_from_instance_methods_one),
                 fido.class.another_class_method
  end

  # Checks the predicted exception class while returning the captured error.
  # @param key [Symbol] answer field
  # @param klass [Class<Exception>] exception raised by the example
  # @return [Exception]
  def assert_predicted_error(key, ...)
    error = assert_raises(...)
    assert_equal Exercises::AboutClassMethods.koans.fetch(key), error.class
    error
  end
end

# rubocop:enable Lint/EmptyClass, Naming/ConstantName, Style/ClassMethods, Style/TrivialAccessors
