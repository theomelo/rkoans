# frozen_string_literal: true

# The example deliberately uses for rather than a block iterator.
# rubocop:disable Style/For

module Exercises
  # Implement multipliers(numbers) returning one lambda per number.
  class ClosureCapture
    # Creates an independently captured lambda for each factor.
    # @return [Array<Proc>]
    def self.multipliers(numbers)
      functions = []
      for factor in numbers
        functions << proc { |value| value * factor }
      end
      functions
    end
  end
end

# rubocop:enable Style/For
