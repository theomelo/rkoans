# frozen_string_literal: true

# The example deliberately contrasts received arguments with values actually used.
# rubocop:disable Lint/UnusedMethodArgument

module Exercises
  # Implement amount(payload, kind) to return a positive Integer amount only when a hash has type
  # equal to the supplied kind and amount is an Integer greater than zero.
  class PatternMatching
    # Implements amount.
    def self.amount(payload, kind)
      case payload
      in { type: _, amount: Integer => number }
        number
      else
        nil
      end
    end
  end
end

# rubocop:enable Lint/UnusedMethodArgument
