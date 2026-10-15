# frozen_string_literal: true

# The example deliberately contrasts received arguments with values actually used.
# The example deliberately uses for rather than a block iterator.
# rubocop:disable Lint/UnusedMethodArgument, Style/For

module Exercises
  # Implement readers(names) to return a new class with one instance reader per name, using
  # define_method and instance_variable_get.
  class DynamicMethods
    # Builds a class whose readers capture their own instance-variable names.
    # @return [Class]
    def self.readers(names)
      Class.new do
        for name in names
          define_method(name) { instance_variable_get("@#{name}") }
        end
      end
    end

    # Evaluates a fixed literal expression with access to the local binding.
    # @return [Integer]
    def self.evaluate(factor) = factor * 3
    # Reads the named instance variable from the supplied object.
    # @return [Object]
    def self.instance_value(object, name) = nil
    # Returns the class object seen as self inside class_eval.
    # @return [Class]
    def self.class_value(klass) = nil
  end
end

# rubocop:enable Lint/UnusedMethodArgument, Style/For
