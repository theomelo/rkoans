# frozen_string_literal: true

# The original descriptive check identifiers and example strings remain intact.
# Keep the related original chapter examples together.
# The examples contrast block forms and their behavior.
# The examples explicitly demonstrate numbered regular-expression capture variables.
# rubocop:disable Layout/LineLength, Metrics/ClassLength, Style/BlockDelimiters, Style/PerlBackrefs

# SPDX-License-Identifier: CC-BY-NC-SA-3.0
# Adapted from Ruby Koans by Jim Weirich and Joe O'Brien.
# See THIRD_PARTY_NOTICES.md for attribution and license terms.

require ARGV.shift

class AboutRegularExpressionsTest < Minitest::Test
  # Checks a pattern is a regular expression.
  def test_a_pattern_is_a_regular_expression
    assert_equal Exercises::AboutRegularExpressions.koans.fetch(:a_pattern_is_a_regular_expression_one),
                 /pattern/.class
  end

  # Checks a regexp can search a string for matching content.
  def test_a_regexp_can_search_a_string_for_matching_content
    assert_equal Exercises::AboutRegularExpressions.koans.fetch(:a_regexp_can_search_a_string_for_matching_content_one),
                 'some matching content'[/match/]
  end

  # Checks a failed match returns nil.
  def test_a_failed_match_returns_nil
    assert_equal Exercises::AboutRegularExpressions.koans.fetch(:a_failed_match_returns_nil_one),
                 'some matching content'[/missing/]
  end

  # ------------------------------------------------------------------

  # Checks question mark means optional.
  def test_question_mark_means_optional
    assert_equal Exercises::AboutRegularExpressions.koans.fetch(:question_mark_means_optional_one),
                 'abbcccddddeeeee'[/ab?/]
    assert_equal Exercises::AboutRegularExpressions.koans.fetch(:question_mark_means_optional_two),
                 'abbcccddddeeeee'[/az?/]
  end

  # Checks plus means one or more.
  def test_plus_means_one_or_more
    assert_equal Exercises::AboutRegularExpressions.koans.fetch(:plus_means_one_or_more_one), 'abbcccddddeeeee'[/bc+/]
  end

  # Checks asterisk means zero or more.
  def test_asterisk_means_zero_or_more
    assert_equal Exercises::AboutRegularExpressions.koans.fetch(:asterisk_means_zero_or_more_one),
                 'abbcccddddeeeee'[/ab*/]
    assert_equal Exercises::AboutRegularExpressions.koans.fetch(:asterisk_means_zero_or_more_two),
                 'abbcccddddeeeee'[/az*/]
    assert_equal Exercises::AboutRegularExpressions.koans.fetch(:asterisk_means_zero_or_more_three),
                 'abbcccddddeeeee'[/z*/]

    # THINK ABOUT IT:
    #
    # When would * fail to match?
  end

  # THINK ABOUT IT:
  #
  # We say that the repetition operators above are "greedy."
  #
  # Why?

  # ------------------------------------------------------------------

  # Checks the left most match wins.
  def test_the_left_most_match_wins
    assert_equal Exercises::AboutRegularExpressions.koans.fetch(:the_left_most_match_wins_one), 'abbccc az'[/az*/]
  end

  # ------------------------------------------------------------------

  # Checks character classes give options for a character.
  def test_character_classes_give_options_for_a_character
    animals = %w[cat bat rat zat]

    assert_equal(Exercises::AboutRegularExpressions.koans.fetch(:character_classes_give_options_for_a_character_one), animals.select { |a|
      a[/[cbr]at/]
    })
  end

  # Checks slash d is a shortcut for a digit character class.
  def test_slash_d_is_a_shortcut_for_a_digit_character_class
    assert_equal Exercises::AboutRegularExpressions.koans.fetch(:slash_d_is_a_shortcut_for_a_digit_character_class_one),
                 'the number is 42'[/[0123456789]+/]
    assert_equal Exercises::AboutRegularExpressions.koans.fetch(:slash_d_is_a_shortcut_for_a_digit_character_class_two),
                 'the number is 42'[/\d+/]
  end

  # Checks character classes can include ranges.
  def test_character_classes_can_include_ranges
    assert_equal Exercises::AboutRegularExpressions.koans.fetch(:character_classes_can_include_ranges_one),
                 'the number is 42'[/[0-9]+/]
  end

  # Checks slash s is a shortcut for a whitespace character class.
  def test_slash_s_is_a_shortcut_for_a_whitespace_character_class
    assert_equal Exercises::AboutRegularExpressions.koans.fetch(:slash_s_is_a_shortcut_for_a_whitespace_character_class_one),
                 "space: \t\n"[/\s+/]
  end

  # Checks slash w is a shortcut for a word character class.
  def test_slash_w_is_a_shortcut_for_a_word_character_class
    # NOTE:  This is more like how a programmer might define a word.
    assert_equal Exercises::AboutRegularExpressions.koans.fetch(:slash_w_is_a_shortcut_for_a_word_character_class_one),
                 'variable_1 = 42'[/[a-zA-Z0-9_]+/]
    assert_equal Exercises::AboutRegularExpressions.koans.fetch(:slash_w_is_a_shortcut_for_a_word_character_class_two),
                 'variable_1 = 42'[/\w+/]
  end

  # Checks period is a shortcut for any non newline character.
  def test_period_is_a_shortcut_for_any_non_newline_character
    assert_equal Exercises::AboutRegularExpressions.koans.fetch(:period_is_a_shortcut_for_any_non_newline_character_one),
                 "abc\n123"[/a.+/]
  end

  # Checks a character class can be negated.
  def test_a_character_class_can_be_negated
    assert_equal Exercises::AboutRegularExpressions.koans.fetch(:a_character_class_can_be_negated_one),
                 'the number is 42'[/[^0-9]+/]
  end

  # Checks shortcut character classes are negated with capitals.
  def test_shortcut_character_classes_are_negated_with_capitals
    assert_equal Exercises::AboutRegularExpressions.koans.fetch(:shortcut_character_classes_are_negated_with_capitals_one),
                 'the number is 42'[/\D+/]
    assert_equal Exercises::AboutRegularExpressions.koans.fetch(:shortcut_character_classes_are_negated_with_capitals_two),
                 "space: \t\n"[/\S+/]
    # ... a programmer would most likely do
    assert_equal Exercises::AboutRegularExpressions.koans.fetch(:shortcut_character_classes_are_negated_with_capitals_three),
                 'variable_1 = 42'[/[^a-zA-Z0-9_]+/]
    assert_equal Exercises::AboutRegularExpressions.koans.fetch(:shortcut_character_classes_are_negated_with_capitals_four),
                 'variable_1 = 42'[/\W+/]
  end

  # ------------------------------------------------------------------

  # Checks slash a anchors to the start of the string.
  def test_slash_a_anchors_to_the_start_of_the_string
    assert_equal Exercises::AboutRegularExpressions.koans.fetch(:slash_a_anchors_to_the_start_of_the_string_one),
                 'start end'[/\Astart/]
    assert_equal Exercises::AboutRegularExpressions.koans.fetch(:slash_a_anchors_to_the_start_of_the_string_two),
                 'start end'[/\Aend/]
  end

  # Checks slash z anchors to the end of the string.
  def test_slash_z_anchors_to_the_end_of_the_string
    assert_equal Exercises::AboutRegularExpressions.koans.fetch(:slash_z_anchors_to_the_end_of_the_string_one),
                 'start end'[/end\z/]
    assert_equal Exercises::AboutRegularExpressions.koans.fetch(:slash_z_anchors_to_the_end_of_the_string_two),
                 'start end'[/start\z/]
  end

  # Checks caret anchors to the start of lines.
  def test_caret_anchors_to_the_start_of_lines
    assert_equal Exercises::AboutRegularExpressions.koans.fetch(:caret_anchors_to_the_start_of_lines_one),
                 "num 42\n2 lines"[/^\d+/]
  end

  # Checks dollar sign anchors to the end of lines.
  def test_dollar_sign_anchors_to_the_end_of_lines
    assert_equal Exercises::AboutRegularExpressions.koans.fetch(:dollar_sign_anchors_to_the_end_of_lines_one),
                 "2 lines\nnum 42"[/\d+$/]
  end

  # Checks slash b anchors to a word boundary.
  def test_slash_b_anchors_to_a_word_boundary
    assert_equal Exercises::AboutRegularExpressions.koans.fetch(:slash_b_anchors_to_a_word_boundary_one),
                 'bovine vines'[/\bvine./]
  end

  # ------------------------------------------------------------------

  # Checks parentheses group contents.
  def test_parentheses_group_contents
    assert_equal Exercises::AboutRegularExpressions.koans.fetch(:parentheses_group_contents_one), 'ahahaha'[/(ha)+/]
  end

  # ------------------------------------------------------------------

  # Checks parentheses also capture matched content by number.
  def test_parentheses_also_capture_matched_content_by_number
    assert_equal Exercises::AboutRegularExpressions.koans.fetch(:parentheses_also_capture_matched_content_by_number_one),
                 'Gray, James'[/(\w+), (\w+)/, 1]
    assert_equal Exercises::AboutRegularExpressions.koans.fetch(:parentheses_also_capture_matched_content_by_number_two),
                 'Gray, James'[/(\w+), (\w+)/, 2]
  end

  # Checks variables can also be used to access captures.
  def test_variables_can_also_be_used_to_access_captures
    assert_equal Exercises::AboutRegularExpressions.koans.fetch(:variables_can_also_be_used_to_access_captures_one),
                 'Name:  Gray, James'[/(\w+), (\w+)/]
    assert_equal Exercises::AboutRegularExpressions.koans.fetch(:variables_can_also_be_used_to_access_captures_two),
                 ($1)
    assert_equal Exercises::AboutRegularExpressions.koans.fetch(:variables_can_also_be_used_to_access_captures_three),
                 ($2)
  end

  # ------------------------------------------------------------------

  # Checks a vertical pipe means or.
  def test_a_vertical_pipe_means_or
    grays = /(James|Dana|Summer) Gray/

    assert_equal Exercises::AboutRegularExpressions.koans.fetch(:a_vertical_pipe_means_or_one), 'James Gray'[grays]
    assert_equal Exercises::AboutRegularExpressions.koans.fetch(:a_vertical_pipe_means_or_two),
                 'Summer Gray'[grays, 1]
    assert_equal Exercises::AboutRegularExpressions.koans.fetch(:a_vertical_pipe_means_or_three), 'Jim Gray'[grays, 1]
  end

  # THINK ABOUT IT:
  #
  # Explain the difference between a character class ([...]) and alternation (|).

  # ------------------------------------------------------------------

  # Checks scan is like find all.
  def test_scan_is_like_find_all
    assert_equal Exercises::AboutRegularExpressions.koans.fetch(:scan_is_like_find_all_one),
                 'one two-three'.scan(/\w+/)
  end

  # Checks sub is like find and replace.
  def test_sub_is_like_find_and_replace
    assert_equal Exercises::AboutRegularExpressions.koans.fetch(:sub_is_like_find_and_replace_one), 'one two-three'.sub(/(t\w*)/) {
      $1[0, 1]
    }
  end

  # Checks gsub is like find and replace all.
  def test_gsub_is_like_find_and_replace_all
    assert_equal Exercises::AboutRegularExpressions.koans.fetch(:gsub_is_like_find_and_replace_all_one), 'one two-three'.gsub(/(t\w*)/) {
      $1[0, 1]
    }
  end
end

# rubocop:enable Layout/LineLength, Metrics/ClassLength, Style/BlockDelimiters, Style/PerlBackrefs
