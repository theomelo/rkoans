# frozen_string_literal: true

# The fixed literal expression is an isolated binding or syntax experiment.
# rubocop:disable Style/EvalWithLocation

module Exercises
  # Implement readers(names) to return a new class with one instance reader per name, using
  # define_method and instance_variable_get.
  class DynamicMethods
    # Builds a class whose readers capture their own instance-variable names.
    # @return [Class]
    def self.readers(names)
      Class.new do
        names.each do |name|
          define_method(name) { instance_variable_get("@#{name}") }
        end
      end
    end

    # Evaluates a fixed literal expression with access to the local binding.
    # @return [Integer]
    def self.evaluate(factor) = eval('factor * 2', binding)
    # Reads the named instance variable from the supplied object.
    # @return [Object]
    def self.instance_value(object, name) = object.instance_variable_get("@#{name}")
    # Returns the class object seen as self inside class_eval.
    # @return [Class]
    def self.class_value(klass) = klass.class_eval { self }
  end
end

# rubocop:enable Style/EvalWithLocation
