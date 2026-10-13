# frozen_string_literal: true

module Exercises
  # Fill the expectations and implement the collection operation below.
  class CollectionBasics
    def self.koans
      { mapped: nil, selected: nil }
    end

    # @param [Object] numbers
    # @return [Object]
    def self.double_odds(numbers)
      numbers.map { |number| number * 2 }
    end
  end
end
