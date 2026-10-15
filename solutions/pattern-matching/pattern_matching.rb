# frozen_string_literal: true

module Exercises
  # Implement amount(payload, kind) to return a positive Integer amount only when a hash has type
  # equal to the supplied kind and amount is an Integer greater than zero.
  class PatternMatching
    # Implements amount.
    def self.amount(payload, kind)
      case payload
      in { type: ^kind, amount: Integer => number } if number.positive?
        number
      else
        nil
      end
    end
  end
end
