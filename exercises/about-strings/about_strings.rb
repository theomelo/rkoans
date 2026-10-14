# frozen_string_literal: true

# SPDX-License-Identifier: CC-BY-NC-SA-3.0
# Adapted from Ruby Koans by Jim Weirich and Joe O'Brien.
# See THIRD_PARTY_NOTICES.md for attribution and license terms.

module Exercises
  # Predicts the results of quoting, interpolation, mutation, and string operations.
  class AboutStrings
    # Replace each nil with the result of its commented example.
    # @return [Hash<Symbol, String | Integer | Boolean | Array<String> | nil>]
    # The answer table is data, not a sequence of operations.
    def self.koans # rubocop:disable Metrics/MethodLength
      {
        # double quoted strings are strings
        # string = "Hello, World"
        double_quoted_string: nil, # string.is_a?(String)
        # single quoted strings are also strings
        # string = 'Goodbye, World'
        single_quoted_string: nil, # string.is_a?(String)
        # use single quotes to create string with double quotes
        # string = 'He said, "Go Away."'
        quoted_speech: nil, # string
        # use double quotes to create strings with single quotes
        # string = "Don't"
        apostrophe: nil, # string
        # use backslash for those hard cases
        # a = "He said, \"Don't\""
        # b = 'He said, "Don\'t"'
        escaped_quotes_equal: nil, # a == b
        # use flexible quoting to handle really hard cases
        # a = %(flexible quotes can handle both ' and " characters)
        # b = %!flexible quotes can handle both ' and " characters!
        # c = %{flexible quotes can handle both ' and " characters}
        flexible_percent_equal: nil, # a == b
        flexible_braces_equal: nil, # a == c
        # flexible quotes can handle multiple lines
        # long_string = %{
        # It was the best of times,
        # It was the worst of times.
        # }
        multiline_length: nil, # long_string.length
        multiline_lines: nil, # long_string.lines.count
        multiline_first_character: nil, # long_string[0,1]
        # here documents can also handle multiple lines
        # long_string = <<~EOS
        #   It was the best of times,
        #   It was the worst of times.
        # EOS
        heredoc_length: nil, # long_string.length
        heredoc_lines: nil, # long_string.lines.count
        heredoc_first_character: nil, # long_string[0,1]
        # plus will concatenate two strings
        # string = "Hello, " + "World"
        concatenated: nil, # string
        # plus concatenation will leave the original strings unmodified
        # hi = "Hello, "
        # there = "World"
        # string = hi + there
        plus_original: nil, # hi
        plus_other: nil, # there
        # plus equals will concatenate to the end of a string
        # hi = "Hello, "
        # there = "World"
        # hi += there
        plus_equals_result: nil, # hi
        # plus equals also will leave the original string unmodified
        # original_string = "Hello, "
        # hi = original_string
        # there = "World"
        # hi += there
        plus_equals_original: nil, # original_string
        # the shovel operator will also append content to a string
        # hi = "Hello, "
        # there = "World"
        # hi << there
        append_result: nil, # hi
        append_other: nil, # there
        # the shovel operator modifies the original string
        # original_string = "Hello, "
        # hi = original_string
        # there = "World"
        # hi << there
        # THINK ABOUT IT:
        #
        # Ruby programmers tend to favor the shovel operator (<<) over the
        # plus equals operator (+=) when building up strings.  Why?
        appended_original: nil, # original_string
        # double quoted string interpret escape characters
        # string = "\n"
        double_escape_length: nil, # string.size
        # single quoted string do not interpret escape characters
        # string = '\n'
        single_escape_length: nil, # string.size
        # single quotes sometimes interpret escape characters
        # string = '\\\''
        quote_escape_length: nil, # string.size
        quote_escape_text: nil, # string
        # double quoted strings interpolate variables
        # value = 123
        # string = "The value is #{value}"
        interpolated: nil, # string
        # single quoted strings do not interpolate
        # value = 123
        # string = 'The value is #{value}'
        not_interpolated: nil, # string
        # any ruby expression may be interpolated
        # string = "The square root of 5 is #{Math.sqrt(5)}"
        math_interpolation: nil, # string
        # you can get a substring from a string
        # string = "Bacon, lettuce and tomato"
        substring_slice: nil, # string[7,3]
        substring_range: nil, # string[7..9]
        # you can get a single character from a string
        # string = "Bacon, lettuce and tomato"
        # Surprised?
        single_character: nil, # string[1]
        # in modern ruby single characters are represented by strings
        character_literal: nil, # ?a
        character_equals_integer: nil, # ?a == 97
        # strings can be split
        # string = "Sausage Egg Cheese"
        # words = string.split
        split_words: nil, # words
        # strings can be split with different patterns
        # string = "the:rain:in:spain"
        # words = string.split(/:/)
        # NOTE: Patterns are formed from Regular Expressions.  Ruby has a
        # powerful Regular Expression library.
        pattern_words: nil, # words
        # strings can be joined
        # words = ["Now", "is", "the", "time"]
        joined_words: nil, # words.join(" ")
        # strings are unique objects
        # a = "a string"
        # b = "a string"
        equal_strings: nil, # a           == b
        same_object: nil # a.object_id == b.object_id
      }
    end
  end
end
