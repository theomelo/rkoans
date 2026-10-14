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
        true_value: :true_stuff,
        false_value: :false_stuff,
        nil_value: :false_stuff,
        one: :true_stuff,
        zero: :true_stuff,
        empty_array: :true_stuff,
        empty_hash: :true_stuff,
        string: :true_stuff,
        empty_string: :true_stuff
      }
    end
  end
end
