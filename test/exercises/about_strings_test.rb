# frozen_string_literal: false

# SPDX-License-Identifier: CC-BY-NC-SA-3.0
# Adapted from Ruby Koans by Jim Weirich and Joe O'Brien.
# See THIRD_PARTY_NOTICES.md for attribution and license terms.

# Literal quoting and character syntax are the subjects of these examples.
# Mutable literals also preserve the original mutation and identity experiments.
# rubocop:disable Style/StringLiterals, Style/PercentLiteralDelimiters, Style/CharacterLiteral
# rubocop:disable Style/StringConcatenation, Lint/UselessAssignment, Lint/InterpolationCheck
# rubocop:disable Minitest/LiteralAsActualArgument, Style/RedundantRegexpArgument, Lint/IdentityComparison
require ARGV.shift

class AboutStringsQuotingTest < Minitest::Test
  # Checks double quoted strings are strings.
  def test_double_quoted_strings_are_strings
    string = "Hello, World"

    assert_equal Exercises::AboutStrings.koans[:double_quoted_string], string.is_a?(String)
  end

  # Checks single quoted strings are also strings.
  def test_single_quoted_strings_are_also_strings
    string = 'Goodbye, World'

    assert_equal Exercises::AboutStrings.koans[:single_quoted_string], string.is_a?(String)
  end

  # Checks use single quotes to create string with double quotes.
  def test_use_single_quotes_to_create_string_with_double_quotes
    string = 'He said, "Go Away."'

    assert_equal Exercises::AboutStrings.koans[:quoted_speech], string
  end

  # Checks use double quotes to create strings with single quotes.
  def test_use_double_quotes_to_create_strings_with_single_quotes
    string = "Don't"

    assert_equal Exercises::AboutStrings.koans[:apostrophe], string
  end

  # Checks use backslash for those hard cases.
  def test_use_backslash_for_those_hard_cases
    a = "He said, \"Don't\""
    b = 'He said, "Don\'t"'

    assert_equal Exercises::AboutStrings.koans[:escaped_quotes_equal], a == b
  end

  # Checks use flexible quoting to handle really hard cases.
  def test_use_flexible_quoting_to_handle_really_hard_cases
    a = %(flexible quotes can handle both ' and " characters)
    b = %!flexible quotes can handle both ' and " characters!
    c = %{flexible quotes can handle both ' and " characters}

    assert_equal Exercises::AboutStrings.koans[:flexible_percent_equal], a == b
    assert_equal Exercises::AboutStrings.koans[:flexible_braces_equal], a == c
  end

  # Checks flexible quotes can handle multiple lines.
  def test_flexible_quotes_can_handle_multiple_lines
    long_string = %{
It was the best of times,
It was the worst of times.
}

    assert_equal Exercises::AboutStrings.koans[:multiline_length], long_string.length
    assert_equal Exercises::AboutStrings.koans[:multiline_lines], long_string.lines.count
    assert_equal Exercises::AboutStrings.koans[:multiline_first_character], long_string[0, 1]
  end

  # Checks here documents can also handle multiple lines.
  def test_here_documents_can_also_handle_multiple_lines
    long_string = <<~TEXT
      It was the best of times,
      It was the worst of times.
    TEXT
    assert_equal Exercises::AboutStrings.koans[:heredoc_length], long_string.length
    assert_equal Exercises::AboutStrings.koans[:heredoc_lines], long_string.lines.count
    assert_equal Exercises::AboutStrings.koans[:heredoc_first_character], long_string[0, 1]
  end
end

class AboutStringsMutationTest < Minitest::Test
  # Checks plus will concatenate two strings.
  def test_plus_will_concatenate_two_strings
    string = "Hello, " + "World"

    assert_equal Exercises::AboutStrings.koans[:concatenated], string
  end

  # Checks plus concatenation will leave the original strings unmodified.
  def test_plus_concatenation_will_leave_the_original_strings_unmodified
    hi = "Hello, "
    there = "World"
    string = hi + there

    assert_equal Exercises::AboutStrings.koans[:plus_original], hi
    assert_equal Exercises::AboutStrings.koans[:plus_other], there
  end

  # Checks plus equals will concatenate to the end of a string.
  def test_plus_equals_will_concatenate_to_the_end_of_a_string
    hi = "Hello, "
    there = "World"
    hi += there

    assert_equal Exercises::AboutStrings.koans[:plus_equals_result], hi
  end

  # Checks plus equals also will leave the original string unmodified.
  def test_plus_equals_also_will_leave_the_original_string_unmodified
    original_string = "Hello, "
    hi = original_string
    there = "World"
    hi += there

    assert_equal Exercises::AboutStrings.koans[:plus_equals_original], original_string
  end

  # Checks the shovel operator will also append content to a string.
  def test_the_shovel_operator_will_also_append_content_to_a_string
    hi = "Hello, "
    there = "World"
    hi << there

    assert_equal Exercises::AboutStrings.koans[:append_result], hi
    assert_equal Exercises::AboutStrings.koans[:append_other], there
  end

  # Checks the shovel operator modifies the original string.
  def test_the_shovel_operator_modifies_the_original_string
    original_string = "Hello, "
    hi = original_string
    there = "World"
    hi << there

    assert_equal Exercises::AboutStrings.koans[:appended_original], original_string

    # THINK ABOUT IT:
    #
    # Ruby programmers tend to favor the shovel operator (<<) over the
    # plus equals operator (+=) when building up strings.  Why?
  end
end

class AboutStringsValuesTest < Minitest::Test
  # Checks double quoted string interpret escape characters.
  def test_double_quoted_string_interpret_escape_characters
    string = "\n"

    assert_equal Exercises::AboutStrings.koans[:double_escape_length], string.size
  end

  # Checks single quoted string do not interpret escape characters.
  def test_single_quoted_string_do_not_interpret_escape_characters
    string = '\n'

    assert_equal Exercises::AboutStrings.koans[:single_escape_length], string.size
  end

  # Checks single quotes sometimes interpret escape characters.
  def test_single_quotes_sometimes_interpret_escape_characters
    string = '\\\''

    assert_equal Exercises::AboutStrings.koans[:quote_escape_length], string.size
    assert_equal Exercises::AboutStrings.koans[:quote_escape_text], string
  end

  # Checks double quoted strings interpolate variables.
  def test_double_quoted_strings_interpolate_variables
    value = 123
    string = "The value is #{value}"

    assert_equal Exercises::AboutStrings.koans[:interpolated], string
  end

  # Checks single quoted strings do not interpolate.
  def test_single_quoted_strings_do_not_interpolate
    value = 123
    string = 'The value is #{value}'

    assert_equal Exercises::AboutStrings.koans[:not_interpolated], string
  end

  # Checks any ruby expression may be interpolated.
  def test_any_ruby_expression_may_be_interpolated
    string = "The square root of 5 is #{Math.sqrt(5)}"

    assert_equal Exercises::AboutStrings.koans[:math_interpolation], string
  end

  # Checks you can get a substring from a string.
  def test_you_can_get_a_substring_from_a_string
    string = "Bacon, lettuce and tomato"

    assert_equal Exercises::AboutStrings.koans[:substring_slice], string[7, 3]
    assert_equal Exercises::AboutStrings.koans[:substring_range], string[7..9]
  end

  # Checks you can get a single character from a string.
  def test_you_can_get_a_single_character_from_a_string
    string = "Bacon, lettuce and tomato"

    assert_equal Exercises::AboutStrings.koans[:single_character], string[1]

    # Surprised?
  end

  # Checks in modern ruby single characters are represented by strings.
  def test_in_modern_ruby_single_characters_are_represented_by_strings
    assert_equal Exercises::AboutStrings.koans[:character_literal], ?a
    assert_equal Exercises::AboutStrings.koans[:character_equals_integer], ?a == 97
  end

  # Checks strings can be split.
  def test_strings_can_be_split
    string = "Sausage Egg Cheese"
    words = string.split

    assert_equal Exercises::AboutStrings.koans[:split_words], words
  end

  # Checks strings can be split with different patterns.
  def test_strings_can_be_split_with_different_patterns
    string = "the:rain:in:spain"
    words = string.split(/:/)

    assert_equal Exercises::AboutStrings.koans[:pattern_words], words

    # NOTE: Patterns are formed from Regular Expressions.  Ruby has a
    # powerful Regular Expression library.
  end

  # Checks strings can be joined.
  def test_strings_can_be_joined
    words = %w[Now is the time]

    assert_equal Exercises::AboutStrings.koans[:joined_words], words.join(" ")
  end

  # Checks strings are unique objects.
  def test_strings_are_unique_objects
    a = "a string"
    b = "a string"

    assert_equal Exercises::AboutStrings.koans[:equal_strings], a == b
    assert_equal Exercises::AboutStrings.koans[:same_object], a.object_id == b.object_id
  end
end

# rubocop:enable Style/StringLiterals, Style/PercentLiteralDelimiters, Style/CharacterLiteral
# rubocop:enable Style/StringConcatenation, Lint/UselessAssignment, Lint/InterpolationCheck
# rubocop:enable Minitest/LiteralAsActualArgument, Style/RedundantRegexpArgument, Lint/IdentityComparison
