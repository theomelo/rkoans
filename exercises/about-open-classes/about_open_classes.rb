# frozen_string_literal: true

# SPDX-License-Identifier: CC-BY-NC-SA-3.0
# Adapted from Ruby Koans by Jim Weirich and Joe O'Brien.
# See THIRD_PARTY_NOTICES.md for attribution and license terms.

module Exercises
  # Predictions for open classes examples.
  class AboutOpenClasses
    # Replace each :fill_me_in with the result of the described expression.
    # @return [Hash<Symbol, Object>]
    # This method is an answer table, not a sequence of operations.
    def self.koans
      {
        # As defined dogs do bark.
        # fido = Dog.new
        # assert_equal __, fido.bark
        # Predict: fido.bark
        as_defined_dogs_do_bark_one: :fill_me_in,
        # After reopening dogs can both wag and bark.
        # fido = Dog.new
        # assert_equal __, fido.wag
        # assert_equal __, fido.bark
        # Predict: fido.wag
        after_reopening_dogs_can_both_wag_and_bark_one: :fill_me_in,
        # Predict: fido.bark
        after_reopening_dogs_can_both_wag_and_bark_two: :fill_me_in,
        # Even existing built in classes can be reopened.
        # assert_equal __, 1.answer_to_life_universe_and_everything?
        # assert_equal __, 42.answer_to_life_universe_and_everything?
        # Predict: 1.answer_to_life_universe_and_everything?
        even_existing_built_in_classes_can_be_reopened_one: :fill_me_in,
        # Predict: 42.answer_to_life_universe_and_everything?
        even_existing_built_in_classes_can_be_reopened_two: :fill_me_in
      }
    end
  end
end
