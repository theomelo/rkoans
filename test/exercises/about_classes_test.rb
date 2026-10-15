# frozen_string_literal: true

# The original descriptive check identifiers and example strings remain intact.
# An empty class demonstrates construction without custom methods.
# Conversions deliberately compare the same protocol on different built-in objects.
# Keep the related original chapter examples together.
# Explicit setters are compared with generated accessors in this chapter.
# The examples contrast block forms and their behavior.
# The fixed literal expression is an isolated binding or syntax experiment.
# Explicit getter definitions are compared with attr_reader and attr_accessor.
# rubocop:disable Layout/LineLength, Lint/EmptyClass, Lint/RedundantTypeConversion, Metrics/ClassLength, Naming/AccessorMethodName, Style/BlockDelimiters, Style/EvalWithLocation, Style/TrivialAccessors

# SPDX-License-Identifier: CC-BY-NC-SA-3.0
# Adapted from Ruby Koans by Jim Weirich and Joe O'Brien.
# See THIRD_PARTY_NOTICES.md for attribution and license terms.

require ARGV.shift
class AboutClassesTest < Minitest::Test
  class Dog
  end

  # Checks instances of classes can be created with new.
  def test_instances_of_classes_can_be_created_with_new
    fido = Dog.new

    assert_equal Exercises::AboutClasses.koans.fetch(:instances_of_classes_can_be_created_with_new_one), fido.class
  end

  # ------------------------------------------------------------------

  class Dog2
    # Demonstrates set name.
    def set_name(a_name)
      @name = a_name
    end
  end

  # Checks instance variables can be set by assigning to them.
  def test_instance_variables_can_be_set_by_assigning_to_them
    fido = Dog2.new

    assert_equal Exercises::AboutClasses.koans.fetch(:instance_variables_can_be_set_by_assigning_to_them_one),
                 fido.instance_variables

    fido.set_name('Fido')

    assert_equal Exercises::AboutClasses.koans.fetch(:instance_variables_can_be_set_by_assigning_to_them_two),
                 fido.instance_variables
  end

  # Checks instance variables cannot be accessed outside the class.
  def test_instance_variables_cannot_be_accessed_outside_the_class
    fido = Dog2.new
    fido.set_name('Fido')

    assert_predicted_error(:instance_variables_cannot_be_accessed_outside_the_class_one, ::NoMethodError) do
      fido.name
    end

    assert_predicted_error(:instance_variables_cannot_be_accessed_outside_the_class_two, ::SyntaxError) do
      eval 'fido.@name'
    end
  end

  # Checks you can politely ask for instance variable values.
  def test_you_can_politely_ask_for_instance_variable_values
    fido = Dog2.new
    fido.set_name('Fido')

    assert_equal Exercises::AboutClasses.koans.fetch(:you_can_politely_ask_for_instance_variable_values_one),
                 fido.instance_variable_get('@name')
  end

  # Checks you can rip the value out using instance eval.
  def test_you_can_rip_the_value_out_using_instance_eval
    fido = Dog2.new
    fido.set_name('Fido')

    assert_equal Exercises::AboutClasses.koans.fetch(:you_can_rip_the_value_out_using_instance_eval_one), fido.instance_eval('@name') # string version
    assert_equal(Exercises::AboutClasses.koans.fetch(:you_can_rip_the_value_out_using_instance_eval_two), fido.instance_eval {
      @name
    }) # block version
  end

  # ------------------------------------------------------------------

  class Dog3
    # Demonstrates set name.
    def set_name(a_name)
      @name = a_name
    end

    # Demonstrates name.
    def name
      @name
    end
  end

  # Checks you can create accessor methods to return instance variables.
  def test_you_can_create_accessor_methods_to_return_instance_variables
    fido = Dog3.new
    fido.set_name('Fido')

    assert_equal Exercises::AboutClasses.koans.fetch(:you_can_create_accessor_methods_to_return_instance_variables_one),
                 fido.name
  end

  # ------------------------------------------------------------------

  class Dog4
    attr_reader :name

    # Demonstrates set name.
    def set_name(a_name)
      @name = a_name
    end
  end

  # Checks attr reader will automatically define an accessor.
  def test_attr_reader_will_automatically_define_an_accessor
    fido = Dog4.new
    fido.set_name('Fido')

    assert_equal Exercises::AboutClasses.koans.fetch(:attr_reader_will_automatically_define_an_accessor_one),
                 fido.name
  end

  # ------------------------------------------------------------------

  class Dog5
    attr_accessor :name
  end

  # Checks attr accessor will automatically define both read and write accessors.
  def test_attr_accessor_will_automatically_define_both_read_and_write_accessors
    fido = Dog5.new

    fido.name = 'Fido'

    assert_equal Exercises::AboutClasses.koans.fetch(:attr_accessor_will_automatically_define_both_read_and_write_accessors_one),
                 fido.name
  end

  # ------------------------------------------------------------------

  class Dog6
    attr_reader :name

    # Demonstrates initialize.
    def initialize(initial_name)
      @name = initial_name
    end
  end

  # Checks initialize provides initial values for instance variables.
  def test_initialize_provides_initial_values_for_instance_variables
    fido = Dog6.new('Fido')

    assert_equal Exercises::AboutClasses.koans.fetch(:initialize_provides_initial_values_for_instance_variables_one),
                 fido.name
  end

  # Checks args to new must match initialize.
  def test_args_to_new_must_match_initialize
    assert_predicted_error(:args_to_new_must_match_initialize_one, ::ArgumentError) do
      Dog6.new
    end
    # THINK ABOUT IT:
    # Why is this so?
  end

  # Checks different objects have different instance variables.
  def test_different_objects_have_different_instance_variables
    fido = Dog6.new('Fido')
    rover = Dog6.new('Rover')

    assert_equal Exercises::AboutClasses.koans.fetch(:different_objects_have_different_instance_variables_one),
                 (rover.name != fido.name)
  end

  # ------------------------------------------------------------------

  class Dog7
    attr_reader :name

    # Demonstrates initialize.
    def initialize(initial_name)
      @name = initial_name
    end

    # Demonstrates get self.
    def get_self
      self
    end

    # Demonstrates to s.
    def to_s
      @name
    end

    # Demonstrates inspect.
    def inspect
      "<Dog named '#{name}'>"
    end
  end

  # Checks inside a method self refers to the containing object.
  def test_inside_a_method_self_refers_to_the_containing_object
    fido = Dog7.new('Fido')

    fidos_self = fido.get_self

    assert_equal Exercises::AboutClasses.koans.fetch(:inside_a_method_self_refers_to_the_containing_object_one),
                 fidos_self.equal?(fido)
  end

  # Checks to s provides a string version of the object.
  def test_to_s_provides_a_string_version_of_the_object
    fido = Dog7.new('Fido')

    assert_equal Exercises::AboutClasses.koans.fetch(:to_s_provides_a_string_version_of_the_object_one), fido.to_s
  end

  # Checks to s is used in string interpolation.
  def test_to_s_is_used_in_string_interpolation
    fido = Dog7.new('Fido')

    assert_equal Exercises::AboutClasses.koans.fetch(:to_s_is_used_in_string_interpolation_one), "My dog is #{fido}"
  end

  # Checks inspect provides a more complete string version.
  def test_inspect_provides_a_more_complete_string_version
    fido = Dog7.new('Fido')

    assert_equal Exercises::AboutClasses.koans.fetch(:inspect_provides_a_more_complete_string_version_one),
                 fido.inspect
  end

  # Checks all objects support to s and inspect.
  def test_all_objects_support_to_s_and_inspect
    array = [1, 2, 3]

    assert_equal Exercises::AboutClasses.koans.fetch(:all_objects_support_to_s_and_inspect_one), array.to_s
    assert_equal Exercises::AboutClasses.koans.fetch(:all_objects_support_to_s_and_inspect_two), array.inspect

    assert_equal Exercises::AboutClasses.koans.fetch(:all_objects_support_to_s_and_inspect_three), 'STRING'.to_s
    assert_equal Exercises::AboutClasses.koans.fetch(:all_objects_support_to_s_and_inspect_four), 'STRING'.inspect
  end

  # Checks the predicted exception class while returning the captured error.
  # @param key [Symbol] answer field
  # @param klass [Class<Exception>] exception raised by the example
  # @return [Exception]
  def assert_predicted_error(key, ...)
    error = assert_raises(...)
    assert_equal Exercises::AboutClasses.koans.fetch(key), error.class
    error
  end
end

# rubocop:enable Layout/LineLength, Lint/EmptyClass, Lint/RedundantTypeConversion, Metrics/ClassLength, Naming/AccessorMethodName, Style/BlockDelimiters, Style/EvalWithLocation, Style/TrivialAccessors
