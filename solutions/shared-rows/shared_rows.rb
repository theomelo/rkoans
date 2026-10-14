# frozen_string_literal: true

module Exercises
  # Builds rows whose mutable contents are independent.
  class SharedRows
    # Returns count empty rows, each with its own mutable array.
    # @param count [Integer] nonnegative number of rows
    # @return [Array<Array<Object>>]
    def self.rows(count)
      Array.new(count) { [] }
    end
  end
end
