# frozen_string_literal: true

# SPDX-License-Identifier: CC-BY-NC-SA-3.0
# Adapted from Ruby Koans by Jim Weirich and Joe O'Brien.
# See THIRD_PARTY_NOTICES.md for attribution and license terms.

# Explicit array literals match the assignment examples.
# rubocop:disable Style/WordArray

module Exercises
  # Predicts how array values are assigned to one or several variables.
  class AboutArrayAssignment
    # Returns reference predictions for the assignment examples.
    # @return [Hash<Symbol, String | Array<String> | nil>]
    def self.koans
      {
        names: ['John', 'Smith'],
        first_name: 'John',
        last_name: 'Smith',
        extra_first: 'John',
        extra_last: 'Smith',
        splat_first: 'John',
        splat_last: ['Smith', 'III'],
        short_first: 'Cher',
        short_last: nil,
        nested_first: ['Willie', 'Rae'],
        nested_last: 'Johnson',
        single_first: 'John',
        swapped_first: 'Rob',
        swapped_last: 'Roy'
      }
    end
  end
end

# rubocop:enable Style/WordArray
