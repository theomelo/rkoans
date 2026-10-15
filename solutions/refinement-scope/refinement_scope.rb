# frozen_string_literal: true

module Exercises
  # Speaker.say normally returns "plain".
  class RefinementScope
    # Example Speaker for refinement scope.
    class Speaker
      # Returns the voice selected by the lexical refinement scope.
      # @return [String]
      def say = 'plain'
    end

    # Example Voice for refinement scope.
    module Voice
      refine Speaker do
        # Returns the voice selected by the lexical refinement scope.
        # @return [String]
        def say = 'local'
      end
    end

    # Example Local for refinement scope.
    module Local
      using Voice
      # Returns the value from this scope's example receiver.
      # @return [String]
      def self.call = Speaker.new.say
    end

    # Returns the unrefined voice outside the local scope.
    # @return [String]
    def self.outside = Speaker.new.say
  end
end
