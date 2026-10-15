# frozen_string_literal: true

# Shared class variables are the deliberate starting bug.
# rubocop:disable Style/ClassVars

module Exercises
  # Keep independent counts for Parent and Child.
  class ClassState
    # Example Parent for class state.
    class Parent
      @@count = 0
      # Resets state belonging to this class object.
      # @return [Integer]
      def self.reset = @@count = 0
      # Returns this class object's counter, defaulting to zero.
      # @return [Integer]
      def self.count = @@count
      # Increments this class object's counter.
      # @return [Integer]
      def self.increment = @@count += 1
      # Returns the label supplied by this class's inheritance chain.
      # @return [String]
      def self.label = 'parent'
    end

    # Example Child for class state.
    class Child < Parent
      # Returns the label supplied by this class's inheritance chain.
      # @return [String]
      def self.label = 'child'
    end

    # Returns the singleton class owning the label class method.
    # @return [Class]
    def self.singleton_owner = Parent
  end
end

# rubocop:enable Style/ClassVars
