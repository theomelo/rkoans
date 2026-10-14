# frozen_string_literal: true

# SPDX-License-Identifier: CC-BY-NC-SA-3.0
# Adapted from Ruby Koans by Jim Weirich and Joe O'Brien.
# See THIRD_PARTY_NOTICES.md for attribution and license terms.

module Exercises
  # Supplies the expectations used by the five introductory assertion koans.
  class AboutAsserts
    # Replace the false and nil values with answers that make the checks pass.
    # @return [Hash<Symbol, Boolean | Integer | nil>]
    def self.koans
      {
        truth: false,
        with_message: false,
        expected_value: nil,
        better_expected_value: nil,
        filled_value: nil
      }
    end
  end
end
