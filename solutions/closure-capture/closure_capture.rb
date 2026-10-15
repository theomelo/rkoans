# frozen_string_literal: true

module Exercises
  # Implement multipliers(numbers) returning one lambda per number.
  class ClosureCapture
    # Creates an independently captured lambda for each factor.
    # @return [Array<Proc>]
    def self.multipliers(numbers)
      numbers.map { |factor| ->(value) { value * factor } }
    end
  end
end
