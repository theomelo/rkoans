# frozen_string_literal: true

# SPDX-License-Identifier: CC-BY-NC-SA-3.0
# Adapted from Ruby Koans by Jim Weirich and Joe O'Brien.
# See THIRD_PARTY_NOTICES.md for attribution and license terms.

module Exercises
  # Predictions for pattern matching examples.
  class AboutPatternMatching
    # Replace each :fill_me_in with the result of the described expression.
    # @return [Hash<Symbol, Object>]
    # This method is an answer table, not a sequence of operations.
    def self.koans # rubocop:disable Metrics/MethodLength
      {
        # Pattern may not match.
        # begin
        # case [true, false]
        # in [a, b] if a == b # The condition after pattern is called guard.
        # :match
        # end
        # rescue NoMatchingPatternError => ex
        # What exception has been caught?
        # assert_equal __, ex.class
        # end
        # Predict: ex.class
        pattern_may_not_match_one: :fill_me_in,
        # We can use else.
        # result = case [true, false]
        # in [a, b] if a == b
        # :match
        # else
        # :no_match
        # end
        # assert_equal __, result
        # Predict: result
        we_can_use_else_one: :fill_me_in,
        # Value pattern.
        # assert_equal __, value_pattern(0)
        # assert_equal __, value_pattern(5)
        # assert_equal __, value_pattern(100)
        # assert_equal __, value_pattern('Not a Number!')
        # Predict: value_pattern(0)
        value_pattern_one: :fill_me_in,
        # Predict: value_pattern(5)
        value_pattern_two: :fill_me_in,
        # Predict: value_pattern(100)
        value_pattern_three: :fill_me_in,
        # Predict: value_pattern('Not a Number!')
        value_pattern_four: :fill_me_in,
        # Variable pattern with binding.
        # assert_equal __, variable_pattern_with_binding(1)
        # Predict: variable_pattern_with_binding(1)
        variable_pattern_with_binding_one: :fill_me_in,
        # Variable pattern with pin.
        # assert_equal __, variable_pattern_with_pin(1)
        # Predict: variable_pattern_with_pin(1)
        variable_pattern_with_pin_one: :fill_me_in,
        # Pattern with dropping.
        # assert_equal __, pattern_with_dropping(['I will not be checked', 2])
        # assert_equal __, pattern_with_dropping(['I will not be checked', 'But I will!'])
        # Predict: pattern_with_dropping(['I will not be checked', 2])
        pattern_with_dropping_one: :fill_me_in,
        # Predict: pattern_with_dropping(['I will not be checked', 'But I will!'])
        pattern_with_dropping_two: :fill_me_in,
        # Alternative pattern.
        # assert_equal __, alternative_pattern(0)
        # assert_equal __, alternative_pattern(false)
        # assert_equal __, alternative_pattern(nil)
        # assert_equal __, alternative_pattern(4)
        # Predict: alternative_pattern(0)
        alternative_pattern_one: :fill_me_in,
        # Predict: alternative_pattern(false)
        alternative_pattern_two: :fill_me_in,
        # Predict: alternative_pattern(nil)
        alternative_pattern_three: :fill_me_in,
        # Predict: alternative_pattern(4)
        alternative_pattern_four: :fill_me_in,
        # As pattern.
        # assert_equal __, as_pattern
        # Predict: as_pattern
        as_pattern_one: :fill_me_in,
        # Array pattern.
        # assert_equal __, array_pattern(Deconstructible.new('abcd'))
        # assert_equal __, array_pattern(Deconstructible.new('123'))
        # Predict: array_pattern(Deconstructible.new('abcd'))
        array_pattern_one: :fill_me_in,
        # Predict: array_pattern(Deconstructible.new('123'))
        array_pattern_two: :fill_me_in,
        # Hash pattern.
        # assert_equal __, hash_pattern(LetterAccountant.new('aaabbc'))
        # assert_equal __, hash_pattern(LetterAccountant.new('xyz'))
        # Predict: hash_pattern(LetterAccountant.new('aaabbc'))
        hash_pattern_one: :fill_me_in,
        # Predict: hash_pattern(LetterAccountant.new('xyz'))
        hash_pattern_two: :fill_me_in,
        # Hash pattern with sugar.
        # assert_equal __, hash_pattern_with_sugar(LetterAccountant.new('aaabbc'))
        # assert_equal __, hash_pattern_with_sugar(LetterAccountant.new('xyz'))
        # Predict: hash_pattern_with_sugar(LetterAccountant.new('aaabbc'))
        hash_pattern_with_sugar_one: :fill_me_in,
        # Predict: hash_pattern_with_sugar(LetterAccountant.new('xyz'))
        hash_pattern_with_sugar_two: :fill_me_in
      }
    end
  end
end
