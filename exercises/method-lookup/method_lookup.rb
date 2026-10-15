# frozen_string_literal: true

module Exercises
  # Presenter#call returns "base".
  class MethodLookup
    # Example Wrapper for method lookup.
    module Wrapper
      # Returns the value from this scope's example receiver.
      # @return [String]
      def call = "[#{super}]"
    end

    # Example Presenter for method lookup.
    class Presenter
      include Wrapper

      # Returns the value from this scope's example receiver.
      # @return [String]
      def call = 'base'
    end

    # Lists the first two ancestor names in method lookup order.
    # @return [Array<String>]
    def self.lookup = Presenter.ancestors.first(2).map(&:name)
  end
end
