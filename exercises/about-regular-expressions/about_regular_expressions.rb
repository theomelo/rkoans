# frozen_string_literal: true

# SPDX-License-Identifier: CC-BY-NC-SA-3.0
# Adapted from Ruby Koans by Jim Weirich and Joe O'Brien.
# See THIRD_PARTY_NOTICES.md for attribution and license terms.

module Exercises
  # Predictions for regular expressions examples.
  class AboutRegularExpressions
    # Replace each :fill_me_in with the result of the described expression.
    # @return [Hash<Symbol, Object>]
    # This method is an answer table, not a sequence of operations.
    def self.koans # rubocop:disable Metrics/MethodLength
      {
        # A pattern is a regular expression.
        # assert_equal __, /pattern/.class
        # Predict: /pattern/.class
        a_pattern_is_a_regular_expression_one: :fill_me_in,
        # A regexp can search a string for matching content.
        # assert_equal __, "some matching content"[/match/]
        # Predict: "some matching content"[/match/]
        a_regexp_can_search_a_string_for_matching_content_one: :fill_me_in,
        # A failed match returns nil.
        # assert_equal __, "some matching content"[/missing/]
        # Predict: "some matching content"[/missing/]
        a_failed_match_returns_nil_one: :fill_me_in,
        # Question mark means optional.
        # assert_equal __, "abbcccddddeeeee"[/ab?/]
        # assert_equal __, "abbcccddddeeeee"[/az?/]
        # Predict: "abbcccddddeeeee"[/ab?/]
        question_mark_means_optional_one: :fill_me_in,
        # Predict: "abbcccddddeeeee"[/az?/]
        question_mark_means_optional_two: :fill_me_in,
        # Plus means one or more.
        # assert_equal __, "abbcccddddeeeee"[/bc+/]
        # Predict: "abbcccddddeeeee"[/bc+/]
        plus_means_one_or_more_one: :fill_me_in,
        # Asterisk means zero or more.
        # assert_equal __, "abbcccddddeeeee"[/ab*/]
        # assert_equal __, "abbcccddddeeeee"[/az*/]
        # assert_equal __, "abbcccddddeeeee"[/z*/]
        # Predict: "abbcccddddeeeee"[/ab*/]
        asterisk_means_zero_or_more_one: :fill_me_in,
        # Predict: "abbcccddddeeeee"[/az*/]
        asterisk_means_zero_or_more_two: :fill_me_in,
        # Predict: "abbcccddddeeeee"[/z*/]
        asterisk_means_zero_or_more_three: :fill_me_in,
        # The left most match wins.
        # assert_equal __, "abbccc az"[/az*/]
        # Predict: "abbccc az"[/az*/]
        the_left_most_match_wins_one: :fill_me_in,
        # Character classes give options for a character.
        # animals = ["cat", "bat", "rat", "zat"]
        # assert_equal __, animals.select { |a| a[/[cbr]at/] }
        # Predict: animals.select { |a| a[/[cbr]at/] }
        character_classes_give_options_for_a_character_one: :fill_me_in,
        # Slash d is a shortcut for a digit character class.
        # assert_equal __, "the number is 42"[/[0123456789]+/]
        # assert_equal __, "the number is 42"[/\d+/]
        # Predict: "the number is 42"[/[0123456789]+/]
        slash_d_is_a_shortcut_for_a_digit_character_class_one: :fill_me_in,
        # Predict: "the number is 42"[/\d+/]
        slash_d_is_a_shortcut_for_a_digit_character_class_two: :fill_me_in,
        # Character classes can include ranges.
        # assert_equal __, "the number is 42"[/[0-9]+/]
        # Predict: "the number is 42"[/[0-9]+/]
        character_classes_can_include_ranges_one: :fill_me_in,
        # Slash s is a shortcut for a whitespace character class.
        # assert_equal __, "space: \t\n"[/\s+/]
        # Predict: "space: \t\n"[/\s+/]
        slash_s_is_a_shortcut_for_a_whitespace_character_class_one: :fill_me_in,
        # Slash w is a shortcut for a word character class.
        # assert_equal __, "variable_1 = 42"[/[a-zA-Z0-9_]+/]
        # assert_equal __, "variable_1 = 42"[/\w+/]
        # Predict: "variable_1 = 42"[/[a-zA-Z0-9_]+/]
        slash_w_is_a_shortcut_for_a_word_character_class_one: :fill_me_in,
        # Predict: "variable_1 = 42"[/\w+/]
        slash_w_is_a_shortcut_for_a_word_character_class_two: :fill_me_in,
        # Period is a shortcut for any non newline character.
        # assert_equal __, "abc\n123"[/a.+/]
        # Predict: "abc\n123"[/a.+/]
        period_is_a_shortcut_for_any_non_newline_character_one: :fill_me_in,
        # A character class can be negated.
        # assert_equal __, "the number is 42"[/[^0-9]+/]
        # Predict: "the number is 42"[/[^0-9]+/]
        a_character_class_can_be_negated_one: :fill_me_in,
        # Shortcut character classes are negated with capitals.
        # assert_equal __, "the number is 42"[/\D+/]
        # assert_equal __, "space: \t\n"[/\S+/]
        # ... a programmer would most likely do
        # assert_equal __, "variable_1 = 42"[/[^a-zA-Z0-9_]+/]
        # assert_equal __, "variable_1 = 42"[/\W+/]
        # Predict: "the number is 42"[/\D+/]
        shortcut_character_classes_are_negated_with_capitals_one: :fill_me_in,
        # Predict: "space: \t\n"[/\S+/]
        shortcut_character_classes_are_negated_with_capitals_two: :fill_me_in,
        # Predict: "variable_1 = 42"[/[^a-zA-Z0-9_]+/]
        shortcut_character_classes_are_negated_with_capitals_three: :fill_me_in,
        # Predict: "variable_1 = 42"[/\W+/]
        shortcut_character_classes_are_negated_with_capitals_four: :fill_me_in,
        # Slash a anchors to the start of the string.
        # assert_equal __, "start end"[/\Astart/]
        # assert_equal __, "start end"[/\Aend/]
        # Predict: "start end"[/\Astart/]
        slash_a_anchors_to_the_start_of_the_string_one: :fill_me_in,
        # Predict: "start end"[/\Aend/]
        slash_a_anchors_to_the_start_of_the_string_two: :fill_me_in,
        # Slash z anchors to the end of the string.
        # assert_equal __, "start end"[/end\z/]
        # assert_equal __, "start end"[/start\z/]
        # Predict: "start end"[/end\z/]
        slash_z_anchors_to_the_end_of_the_string_one: :fill_me_in,
        # Predict: "start end"[/start\z/]
        slash_z_anchors_to_the_end_of_the_string_two: :fill_me_in,
        # Caret anchors to the start of lines.
        # assert_equal __, "num 42\n2 lines"[/^\d+/]
        # Predict: "num 42\n2 lines"[/^\d+/]
        caret_anchors_to_the_start_of_lines_one: :fill_me_in,
        # Dollar sign anchors to the end of lines.
        # assert_equal __, "2 lines\nnum 42"[/\d+$/]
        # Predict: "2 lines\nnum 42"[/\d+$/]
        dollar_sign_anchors_to_the_end_of_lines_one: :fill_me_in,
        # Slash b anchors to a word boundary.
        # assert_equal __, "bovine vines"[/\bvine./]
        # Predict: "bovine vines"[/\bvine./]
        slash_b_anchors_to_a_word_boundary_one: :fill_me_in,
        # Parentheses group contents.
        # assert_equal __, "ahahaha"[/(ha)+/]
        # Predict: "ahahaha"[/(ha)+/]
        parentheses_group_contents_one: :fill_me_in,
        # Parentheses also capture matched content by number.
        # assert_equal __, "Gray, James"[/(\w+), (\w+)/, 1]
        # assert_equal __, "Gray, James"[/(\w+), (\w+)/, 2]
        # Predict: "Gray, James"[/(\w+), (\w+)/, 1]
        parentheses_also_capture_matched_content_by_number_one: :fill_me_in,
        # Predict: "Gray, James"[/(\w+), (\w+)/, 2]
        parentheses_also_capture_matched_content_by_number_two: :fill_me_in,
        # Variables can also be used to access captures.
        # assert_equal __, "Name:  Gray, James"[/(\w+), (\w+)/]
        # assert_equal __, $1
        # assert_equal __, $2
        # Predict: "Name:  Gray, James"[/(\w+), (\w+)/]
        variables_can_also_be_used_to_access_captures_one: :fill_me_in,
        # Predict: $1
        variables_can_also_be_used_to_access_captures_two: :fill_me_in,
        # Predict: $2
        variables_can_also_be_used_to_access_captures_three: :fill_me_in,
        # A vertical pipe means or.
        # grays = /(James|Dana|Summer) Gray/
        # assert_equal __, "James Gray"[grays]
        # assert_equal __, "Summer Gray"[grays, 1]
        # assert_equal __, "Jim Gray"[grays, 1]
        # Predict: "James Gray"[grays]
        a_vertical_pipe_means_or_one: :fill_me_in,
        # Predict: "Summer Gray"[grays, 1]
        a_vertical_pipe_means_or_two: :fill_me_in,
        # Predict: "Jim Gray"[grays, 1]
        a_vertical_pipe_means_or_three: :fill_me_in,
        # Scan is like find all.
        # assert_equal __, "one two-three".scan(/\w+/)
        # Predict: "one two-three".scan(/\w+/)
        scan_is_like_find_all_one: :fill_me_in,
        # Sub is like find and replace.
        # assert_equal __, "one two-three".sub(/(t\w*)/) { $1[0, 1] }
        # Predict: "one two-three".sub(/(t\w*)/) { $1[0, 1] }
        sub_is_like_find_and_replace_one: :fill_me_in,
        # Gsub is like find and replace all.
        # assert_equal __, "one two-three".gsub(/(t\w*)/) { $1[0, 1] }
        # Predict: "one two-three".gsub(/(t\w*)/) { $1[0, 1] }
        gsub_is_like_find_and_replace_all_one: :fill_me_in
      }
    end
  end
end
