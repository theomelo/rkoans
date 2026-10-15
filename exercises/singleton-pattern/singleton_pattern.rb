# frozen_string_literal: true

require 'singleton'
module Exercises
  # Use the standard-library Singleton module so Configuration.instance returns the same instance
  # and Configuration.new is not a public constructor.
  class SingletonPattern
    # Example Configuration for singleton pattern.
    class Configuration
      attr_accessor :mode

      # Stores the initial values used by this example.
      # @return [void]
      def initialize = @mode = 'learning'
      # Returns the shared configuration instance.
      # @return [Configuration]
      def self.instance = new
    end
  end
end
