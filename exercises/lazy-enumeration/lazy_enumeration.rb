# frozen_string_literal: true

# The example deliberately contrasts received arguments with values actually used.
# rubocop:disable Lint/UnusedMethodArgument

module Exercises
  # Implement first_multiples(limit) to return the first limit positive multiples of seven, starting
  # at seven, using the endless range (1..).
  class LazyEnumeration
    # Takes the requested number of multiples from a lazy infinite sequence.
    # @return [Array<Integer>]
    def self.first_multiples(limit) = (1..).lazy.select { |n| (n % 7).zero? }.first(3)
  end
end

# rubocop:enable Lint/UnusedMethodArgument
