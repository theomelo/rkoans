# frozen_string_literal: true

# Explicit array literals preserve the introductory examples.
# rubocop:disable Style/SymbolArray

# SPDX-License-Identifier: CC-BY-NC-SA-3.0
# Adapted from Ruby Koans by Jim Weirich and Joe O'Brien.
# See THIRD_PARTY_NOTICES.md for attribution and license terms.

module Exercises
  # Predicts array construction, indexing, slicing, ranges, and destructive operations.
  class AboutArrays
    # Returns reference predictions for the array experiments.
    # Index and slice examples use [:peanut, :butter, :and, :jelly].
    # @return [Hash<Symbol, Class | Integer | Symbol | Array | nil>]
    # The answer table is data, not a sequence of operations.
    def self.koans # rubocop:disable Metrics/MethodLength
      {
        empty_type: Array,
        empty_size: 0,
        second_literal: 2,
        after_append: [1, 2, 333],
        first_index: :peanut,
        first_method: :peanut,
        last_index: :jelly,
        last_method: :jelly,
        negative_last: :jelly,
        negative_third: :butter,
        slice_one: [:peanut],
        slice_two: [:peanut, :butter],
        slice_tail: [:and, :jelly],
        slice_long_tail: [:and, :jelly],
        slice_at_end_zero: [],
        slice_at_end_long: [],
        slice_beyond_end: nil,
        range_type: Range,
        inclusive_range: [1, 2, 3, 4, 5],
        exclusive_range: [1, 2, 3, 4],
        inclusive_slice: [:peanut, :butter, :and],
        exclusive_slice: [:peanut, :butter],
        negative_range_slice: [:and, :jelly],
        after_push: [1, 2, :last],
        popped_value: :last,
        after_pop: [1, 2],
        after_unshift: [:first, 1, 2],
        shifted_value: :first,
        after_shift: [1, 2]
      }
    end
  end
end

# rubocop:enable Style/SymbolArray
