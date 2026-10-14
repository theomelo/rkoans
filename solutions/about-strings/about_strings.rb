# frozen_string_literal: true

# SPDX-License-Identifier: CC-BY-NC-SA-3.0
# Adapted from Ruby Koans by Jim Weirich and Joe O'Brien.
# See THIRD_PARTY_NOTICES.md for attribution and license terms.

module Exercises
  # Predicts the results of quoting, interpolation, mutation, and string operations.
  class AboutStrings
    # Returns reference predictions for the string experiments.
    # @return [Hash<Symbol, String | Integer | Boolean | Array<String> | nil>]
    # The answer table is data, not a sequence of operations.
    def self.koans # rubocop:disable Metrics/MethodLength
      {
        double_quoted_string: true,
        single_quoted_string: true,
        quoted_speech: 'He said, "Go Away."',
        apostrophe: "Don't",
        escaped_quotes_equal: true,
        flexible_percent_equal: true,
        flexible_braces_equal: true,
        multiline_length: 54,
        multiline_lines: 3,
        multiline_first_character: "\n",
        heredoc_length: 53,
        heredoc_lines: 2,
        heredoc_first_character: 'I',
        concatenated: 'Hello, World',
        plus_original: 'Hello, ',
        plus_other: 'World',
        plus_equals_result: 'Hello, World',
        plus_equals_original: 'Hello, ',
        append_result: 'Hello, World',
        append_other: 'World',
        appended_original: 'Hello, World',
        double_escape_length: 1,
        single_escape_length: 2,
        quote_escape_length: 2,
        quote_escape_text: "\\'",
        interpolated: 'The value is 123',
        not_interpolated: "The value is \#{value}",
        math_interpolation: 'The square root of 5 is 2.23606797749979',
        substring_slice: 'let',
        substring_range: 'let',
        single_character: 'a',
        character_literal: 'a',
        character_equals_integer: false,
        split_words: %w[Sausage Egg Cheese],
        pattern_words: %w[the rain in spain],
        joined_words: 'Now is the time',
        equal_strings: true,
        same_object: false
      }
    end
  end
end
