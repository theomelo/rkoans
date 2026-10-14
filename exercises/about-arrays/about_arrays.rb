# frozen_string_literal: true

# SPDX-License-Identifier: CC-BY-NC-SA-3.0
# Adapted from Ruby Koans by Jim Weirich and Joe O'Brien.
# See THIRD_PARTY_NOTICES.md for attribution and license terms.

module Exercises
  # Predicts array construction, indexing, slicing, ranges, and destructive operations.
  class AboutArrays
    # Replace each :fill_me_in with the result of its example.
    # Index and slice examples use [:peanut, :butter, :and, :jelly].
    # @return [Hash<Symbol, Class | Integer | Symbol | Array | nil>]
    # The answer table is data, not a sequence of operations.
    def self.koans # rubocop:disable Metrics/MethodLength
      {
        # Array.new.class
        empty_type: :fill_me_in,
        # Array.new.size
        empty_size: :fill_me_in,
        # array = [1]; array[1] = 2; array[1]
        second_literal: :fill_me_in,
        # array = [1, 2]; array << 333; array
        after_append: :fill_me_in,
        # array[0]
        first_index: :fill_me_in,
        # array.first
        first_method: :fill_me_in,
        # array[3]
        last_index: :fill_me_in,
        # array.last
        last_method: :fill_me_in,
        # array[-1]
        negative_last: :fill_me_in,
        # array[-3]
        negative_third: :fill_me_in,
        # array[0, 1]
        slice_one: :fill_me_in,
        # array[0, 2]
        slice_two: :fill_me_in,
        # array[2, 2]
        slice_tail: :fill_me_in,
        # array[2, 20]
        slice_long_tail: :fill_me_in,
        # array[4, 0]
        slice_at_end_zero: :fill_me_in,
        # array[4, 100]
        slice_at_end_long: :fill_me_in,
        # array[5, 0]
        slice_beyond_end: :fill_me_in,
        # (1..5).class
        range_type: :fill_me_in,
        # (1..5).to_a
        inclusive_range: :fill_me_in,
        # (1...5).to_a
        exclusive_range: :fill_me_in,
        # array[0..2]
        inclusive_slice: :fill_me_in,
        # array[0...2]
        exclusive_slice: :fill_me_in,
        # array[2..-1]
        negative_range_slice: :fill_me_in,
        # array = [1, 2]; array.push(:last); array
        after_push: :fill_me_in,
        # array = [1, 2, :last]; array.pop
        popped_value: :fill_me_in,
        # array = [1, 2, :last]; array.pop; array
        after_pop: :fill_me_in,
        # array = [1, 2]; array.unshift(:first); array
        after_unshift: :fill_me_in,
        # array = [:first, 1, 2]; array.shift
        shifted_value: :fill_me_in,
        # array = [:first, 1, 2]; array.shift; array
        after_shift: :fill_me_in
      }
    end
  end
end
