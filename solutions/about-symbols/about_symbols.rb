# frozen_string_literal: true

# SPDX-License-Identifier: CC-BY-NC-SA-3.0
# Adapted from Ruby Koans by Jim Weirich and Joe O'Brien.
# See THIRD_PARTY_NOTICES.md for attribution and license terms.

module Exercises
  # Predicts symbol identity, conversions, registered names, and supported operations.
  class AboutSymbols
    # Returns reference predictions for the symbol examples.
    # @return [Hash<Symbol, Boolean | Symbol | String | Class>]
    def self.koans
      {
        symbol_type: true,
        same_value: true,
        different_value: false,
        identical_value: true,
        same_object: true,
        method_name_registered: true,
        constant_name: 'RUBY_CONSTANT',
        constant_registered: true,
        from_string: :catsAndDogs,
        with_spaces: :'cats and dogs',
        with_interpolation: :'cats and dogs',
        interpolated_text: 'It is raining cats and dogs.',
        string_type: false,
        equals_string: false,
        each_char: false,
        reverse: false,
        concatenation_error: NoMethodError,
        dynamically_created: :catsdogs
      }
    end
  end
end
