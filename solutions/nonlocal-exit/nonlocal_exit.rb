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
      [action.call, 'after']
    end

    # Returns a proc whose later return targets this already completed method.
    # @return [Proc]
    def self.escaped_proc = proc { return :gone }

    # Uses catch and throw to find the first even number across nested groups.
    # @return [Integer, nil]
    def self.find_even(groups)
      catch(:found) do
        groups.each do |group|
          group.each { |value| throw :found, value if value.even? }
        end
        nil
      end
    end

    # Skips odd values while collecting the even numbers.
    # @return [Array<Integer>]
    def self.skip_odds(values)
      collected = []
      values.each do |value|
        next if value.odd?

        collected << value
      end
      collected
    end
  end
end

# rubocop:enable Style/RedundantReturn
