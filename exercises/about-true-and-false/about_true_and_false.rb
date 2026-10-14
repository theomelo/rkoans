# frozen_string_literal: true

# SPDX-License-Identifier: CC-BY-NC-SA-3.0
# Adapted from Ruby Koans by Jim Weirich and Joe O'Brien.
# See THIRD_PARTY_NOTICES.md for attribution and license terms.

module Exercises
  # Predicts the branch taken by Ruby's conditionals for common values.
  class AboutTrueAndFalse
    # @return [Hash<Symbol, Symbol | nil>] expected branch labels for each input
    def self.koans
      {
        true_value: nil,
        false_value: nil,
        nil_value: nil,
        one: nil,
        zero: nil,
        empty_array: nil,
        empty_hash: nil,
        string: nil,
        empty_string: nil
      }
    end
  end
end
