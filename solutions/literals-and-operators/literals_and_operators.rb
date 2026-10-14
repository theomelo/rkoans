# frozen_string_literal: true

module Exercises
  # Fill predictions for these expressions: !!0, 5 / 2, 5 / 2.0, 1 + 2 * 3, !nil, %w[ruby rails], and (1..3).to_a.
  class LiteralsAndOperators
    # Implements predictions.
    def self.predictions
      {
        zero_truthy: true,
        integer_division: 2,
        float_division: 2.5,
        precedence: 7,
        not_nil: true,
        words: %w[ruby rails],
        range: [1, 2, 3]
      }
    end

    # Implements default for nil.
    def self.default_for_nil(value) = value.nil? ? 'missing' : value
  end
end
