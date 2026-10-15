# frozen_string_literal: true

# Two numbered parameters deliberately demonstrate pair destructuring.
# rubocop:disable Style/NumberedParametersLimit

module Exercises
  # Implement pair_sums using the block’s input pairs; for [[2,3],[4,5]], return [5,9].
  class NumberedParameters
    # Adds both components of each pair using numbered parameters.
    # @return [Array<Integer>]
    def self.pair_sums(pairs) = pairs.map { _1 + _2 }
    # Returns predictions for the expressions described in the brief.
    # @return [Hash<Symbol, Object>]
    def self.predictions = { explicit_and_numbered: false, numbered_pair: true }
  end
end

# rubocop:enable Style/NumberedParametersLimit
