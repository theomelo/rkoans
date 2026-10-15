# frozen_string_literal: true

# Explicit return is the subject of this example.
# rubocop:disable Style/RedundantReturn

module Exercises
  # Implement lambda_trace so return inside the lambda ends only that lambda, and the method still
  # appends "after".
  class NonlocalExit
    # Collects the lambda result and continues the surrounding method.
    # @return [Array<String>]
    def self.lambda_trace
      action = -> { return 'inside' }
      [action.call]
    end

    # Returns a proc whose later return targets this already completed method.
    # @return [Proc]
    def self.escaped_proc = -> { return :gone }
    # Uses catch and throw to find the first even number across nested groups.
    # @return [Integer, nil]
    def self.find_even(groups) = groups.flatten.last
    # Skips odd values while collecting the even numbers.
    # @return [Array<Integer>]
    def self.skip_odds(values) = values
  end
end

# rubocop:enable Style/RedundantReturn
