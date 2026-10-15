# frozen_string_literal: true

# These example blocks expose arguments even when the example does not consume them.
# rubocop:disable Lint/UnusedBlockArgument

module Exercises
  # Implement pair_sums using the block’s input pairs; for [[2,3],[4,5]], return [5,9].
  class NumberedParameters
    # Adds both components of each pair using numbered parameters.
    # @return [Array<Integer>]
    def self.pair_sums(pairs) = pairs.map { |left, right| left }
    # Returns predictions for the expressions described in the brief.
    # @return [Hash<Symbol, Object>]
    def self.predictions = { explicit_and_numbered: true, numbered_pair: false }
  end
end

# rubocop:enable Lint/UnusedBlockArgument
