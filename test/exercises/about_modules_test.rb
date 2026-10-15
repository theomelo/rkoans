# frozen_string_literal: true

# Explicit setters are compared with generated accessors in this chapter.
# rubocop:disable Naming/AccessorMethodName

# SPDX-License-Identifier: CC-BY-NC-SA-3.0
# Adapted from Ruby Koans by Jim Weirich and Joe O'Brien.
# See THIRD_PARTY_NOTICES.md for attribution and license terms.

require ARGV.shift
class AboutModulesTest < Minitest::Test
  module Nameable
    # Demonstrates set name.
    def set_name(new_name)
      @name = new_name
    end

    # Demonstrates here.
    def here
      :in_module
    end
  end

  # Checks cant instantiate modules.
  def test_cant_instantiate_modules
    assert_predicted_error(:cant_instantiate_modules_one, ::NoMethodError) do
      Nameable.new
    end
  end

  # ------------------------------------------------------------------

  class Dog
    include Nameable

    attr_reader :name

    # Demonstrates initialize.
    def initialize
      @name = 'Fido'
    end

    # Demonstrates bark.
    def bark
      'WOOF'
    end

    # Demonstrates here.
    def here
      :in_object
    end
  end

  # Checks normal methods are available in the object.
  def test_normal_methods_are_available_in_the_object
    fido = Dog.new

    assert_equal Exercises::AboutModules.koans.fetch(:normal_methods_are_available_in_the_object_one), fido.bark
  end

  # Checks module methods are also available in the object.
  def test_module_methods_are_also_available_in_the_object
    fido = Dog.new

    fido.set_name('Rover')
  end

  # Checks module methods can affect instance variables in the object.
  def test_module_methods_can_affect_instance_variables_in_the_object
    fido = Dog.new

    assert_equal Exercises::AboutModules.koans.fetch(:module_methods_can_affect_instance_variables_in_the_object_one),
                 fido.name
    fido.set_name('Rover')

    assert_equal Exercises::AboutModules.koans.fetch(:module_methods_can_affect_instance_variables_in_the_object_two),
                 fido.name
  end

  # Checks classes can override module methods.
  def test_classes_can_override_module_methods
    fido = Dog.new

    assert_equal Exercises::AboutModules.koans.fetch(:classes_can_override_module_methods_one), fido.here
  end

  # Checks the predicted exception class while returning the captured error.
  # @param key [Symbol] answer field
  # @param klass [Class<Exception>] exception raised by the example
  # @return [Exception]
  def assert_predicted_error(key, ...)
    error = assert_raises(...)
    assert_equal Exercises::AboutModules.koans.fetch(key), error.class
    error
  end
end

# rubocop:enable Naming/AccessorMethodName
