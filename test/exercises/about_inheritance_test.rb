# frozen_string_literal: true

# SPDX-License-Identifier: CC-BY-NC-SA-3.0
# Adapted from Ruby Koans by Jim Weirich and Joe O'Brien.
# See THIRD_PARTY_NOTICES.md for attribution and license terms.

require ARGV.shift
class AboutInheritanceTest < Minitest::Test
  class Dog
    attr_reader :name

    # Demonstrates initialize.
    def initialize(name)
      @name = name
    end

    # Demonstrates bark.
    def bark
      'WOOF'
    end
  end

  class Chihuahua < Dog
    # Demonstrates wag.
    def wag
      :happy
    end

    # Demonstrates bark.
    def bark
      'yip'
    end
  end

  # Checks subclasses have the parent as an ancestor.
  def test_subclasses_have_the_parent_as_an_ancestor
    assert_equal Exercises::AboutInheritance.koans.fetch(:subclasses_have_the_parent_as_an_ancestor_one),
                 Chihuahua.ancestors.include?(Dog)
  end

  # Checks all classes ultimately inherit from object.
  def test_all_classes_ultimately_inherit_from_object
    assert_equal Exercises::AboutInheritance.koans.fetch(:all_classes_ultimately_inherit_from_object_one),
                 Chihuahua.ancestors.include?(Object)
  end

  # Checks subclasses inherit behavior from parent class.
  def test_subclasses_inherit_behavior_from_parent_class
    chico = Chihuahua.new('Chico')

    assert_equal Exercises::AboutInheritance.koans.fetch(:subclasses_inherit_behavior_from_parent_class_one),
                 chico.name
  end

  # Checks subclasses add new behavior.
  def test_subclasses_add_new_behavior
    chico = Chihuahua.new('Chico')

    assert_equal Exercises::AboutInheritance.koans.fetch(:subclasses_add_new_behavior_one), chico.wag

    assert_predicted_error(:subclasses_add_new_behavior_two, ::NoMethodError) do
      fido = Dog.new('Fido')
      fido.wag
    end
  end

  # Checks subclasses can modify existing behavior.
  def test_subclasses_can_modify_existing_behavior
    chico = Chihuahua.new('Chico')

    assert_equal Exercises::AboutInheritance.koans.fetch(:subclasses_can_modify_existing_behavior_one), chico.bark

    fido = Dog.new('Fido')

    assert_equal Exercises::AboutInheritance.koans.fetch(:subclasses_can_modify_existing_behavior_two), fido.bark
  end

  # ------------------------------------------------------------------

  class BullDog < Dog
    # Demonstrates bark.
    def bark
      "#{super}, GROWL"
    end
  end

  # Checks subclasses can invoke parent behavior via super.
  def test_subclasses_can_invoke_parent_behavior_via_super
    ralph = BullDog.new('Ralph')

    assert_equal Exercises::AboutInheritance.koans.fetch(:subclasses_can_invoke_parent_behavior_via_super_one),
                 ralph.bark
  end

  # ------------------------------------------------------------------

  class GreatDane < Dog
    # Demonstrates growl.
    def growl
      "#{super.bark}, GROWL"
    end
  end

  # Checks super does not work cross method.
  def test_super_does_not_work_cross_method
    george = GreatDane.new('George')
    assert_predicted_error(:super_does_not_work_cross_method_one, ::NoMethodError) do
      george.growl
    end
  end

  # Checks the predicted exception class while returning the captured error.
  # @param key [Symbol] answer field
  # @param klass [Class<Exception>] exception raised by the example
  # @return [Exception]
  def assert_predicted_error(key, ...)
    error = assert_raises(...)
    assert_equal Exercises::AboutInheritance.koans.fetch(key), error.class
    error
  end
end
