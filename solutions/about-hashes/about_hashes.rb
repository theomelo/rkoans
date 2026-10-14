# frozen_string_literal: true

# SPDX-License-Identifier: CC-BY-NC-SA-3.0
# Adapted from Ruby Koans by Jim Weirich and Joe O'Brien.
# See THIRD_PARTY_NOTICES.md for attribution and license terms.

module Exercises
  # Predictions for hashes examples.
  class AboutHashes
    # Returns reference predictions for the examples.
    # @return [Hash<Symbol, Object>]
    # This method is an answer table, not a sequence of operations.
    def self.koans # rubocop:disable Metrics/MethodLength
      {
        creating_hashes_one: ::Hash,
        creating_hashes_two: {},
        creating_hashes_three: 0,
        hash_literals_one: 2,
        accessing_hashes_one: 'uno',
        accessing_hashes_two: 'dos',
        accessing_hashes_three: nil,
        accessing_hashes_with_fetch_one: 'uno',
        accessing_hashes_with_fetch_two: ::KeyError,
        changing_hashes_one: { one: 'eins', two: 'dos' },
        hash_is_unordered_one: true,
        hash_keys_one: 2,
        hash_keys_two: true,
        hash_keys_three: true,
        hash_keys_four: ::Array,
        hash_values_one: 2,
        hash_values_two: true,
        hash_values_three: true,
        hash_values_four: ::Array,
        combining_hashes_one: true,
        combining_hashes_two: true,
        default_value_one: 1,
        default_value_two: nil,
        default_value_three: 1,
        default_value_four: 'dos',
        default_value_is_the_same_object_one: %w[uno dos],
        default_value_is_the_same_object_two: %w[uno dos],
        default_value_is_the_same_object_three: %w[uno dos],
        default_value_is_the_same_object_four: true,
        default_value_with_block_one: ['uno'],
        default_value_with_block_two: ['dos'],
        default_value_with_block_three: [],
        default_value_attribute_one: nil,
        default_value_attribute_two: 'peanut'
      }
    end
  end
end
