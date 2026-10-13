# frozen_string_literal: true

module Exercises
  # A reference implementation for comparison after completing the exercise.
  class BlocksAndMethods
    def self.koans
      { sequence: [1, 2, 3] }
    end

    def self.apply(value)
      yield value
    end
  end
end
