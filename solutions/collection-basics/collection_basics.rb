# frozen_string_literal: true

module Exercises
  # A reference implementation for comparison after completing the exercise.
  class CollectionBasics
    def self.koans
      { mapped: [2, 4, 6], selected: [1, 3] }
    end

    def self.double_odds(numbers)
      numbers.select(&:odd?).map { |number| number * 2 }
    end
  end
end
