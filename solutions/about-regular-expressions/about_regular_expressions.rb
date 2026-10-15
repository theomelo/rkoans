# frozen_string_literal: true

# SPDX-License-Identifier: CC-BY-NC-SA-3.0
# Adapted from Ruby Koans by Jim Weirich and Joe O'Brien.
# See THIRD_PARTY_NOTICES.md for attribution and license terms.

module Exercises
  # Predictions for regular expressions examples.
  class AboutRegularExpressions
    # Returns reference predictions for the examples.
    # @return [Hash<Symbol, Object>]
    # This method is an answer table, not a sequence of operations.
    def self.koans # rubocop:disable Metrics/MethodLength
      {
        a_pattern_is_a_regular_expression_one: ::Regexp,
        a_regexp_can_search_a_string_for_matching_content_one: 'match',
        a_failed_match_returns_nil_one: nil,
        question_mark_means_optional_one: 'ab',
        question_mark_means_optional_two: 'a',
        plus_means_one_or_more_one: 'bccc',
        asterisk_means_zero_or_more_one: 'abb',
        asterisk_means_zero_or_more_two: 'a',
        asterisk_means_zero_or_more_three: '',
        the_left_most_match_wins_one: 'a',
        character_classes_give_options_for_a_character_one: %w[cat bat rat],
        slash_d_is_a_shortcut_for_a_digit_character_class_one: '42',
        slash_d_is_a_shortcut_for_a_digit_character_class_two: '42',
        character_classes_can_include_ranges_one: '42',
        slash_s_is_a_shortcut_for_a_whitespace_character_class_one: " \t\n",
        slash_w_is_a_shortcut_for_a_word_character_class_one: 'variable_1',
        slash_w_is_a_shortcut_for_a_word_character_class_two: 'variable_1',
        period_is_a_shortcut_for_any_non_newline_character_one: 'abc',
        a_character_class_can_be_negated_one: 'the number is ',
        shortcut_character_classes_are_negated_with_capitals_one: 'the number is ',
        shortcut_character_classes_are_negated_with_capitals_two: 'space:',
        shortcut_character_classes_are_negated_with_capitals_three: ' = ',
        shortcut_character_classes_are_negated_with_capitals_four: ' = ',
        slash_a_anchors_to_the_start_of_the_string_one: 'start',
        slash_a_anchors_to_the_start_of_the_string_two: nil,
        slash_z_anchors_to_the_end_of_the_string_one: 'end',
        slash_z_anchors_to_the_end_of_the_string_two: nil,
        caret_anchors_to_the_start_of_lines_one: '2',
        dollar_sign_anchors_to_the_end_of_lines_one: '42',
        slash_b_anchors_to_a_word_boundary_one: 'vines',
        parentheses_group_contents_one: 'hahaha',
        parentheses_also_capture_matched_content_by_number_one: 'Gray',
        parentheses_also_capture_matched_content_by_number_two: 'James',
        variables_can_also_be_used_to_access_captures_one: 'Gray, James',
        variables_can_also_be_used_to_access_captures_two: 'Gray',
        variables_can_also_be_used_to_access_captures_three: 'James',
        a_vertical_pipe_means_or_one: 'James Gray',
        a_vertical_pipe_means_or_two: 'Summer',
        a_vertical_pipe_means_or_three: nil,
        scan_is_like_find_all_one: %w[one two three],
        sub_is_like_find_and_replace_one: 'one t-three',
        gsub_is_like_find_and_replace_all_one: 'one t-t'
      }
    end
  end
end
