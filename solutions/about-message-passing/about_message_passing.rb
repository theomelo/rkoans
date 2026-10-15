# frozen_string_literal: true

# SPDX-License-Identifier: CC-BY-NC-SA-3.0
# Adapted from Ruby Koans by Jim Weirich and Joe O'Brien.
# See THIRD_PARTY_NOTICES.md for attribution and license terms.

module Exercises
  # Predictions for message passing examples.
  class AboutMessagePassing
    # Returns reference predictions for the examples.
    # @return [Hash<Symbol, Object>]
    # This method is an answer table, not a sequence of operations.
    def self.koans # rubocop:disable Metrics/MethodLength
      {
        methods_can_be_invoked_more_dynamically_one: true,
        methods_can_be_invoked_more_dynamically_two: true,
        send_with_underscores_will_also_send_messages_one: true,
        classes_can_be_asked_if_they_know_how_to_respond_one: true,
        classes_can_be_asked_if_they_know_how_to_respond_two: false,
        sending_a_message_with_arguments_one: [],
        sending_a_message_with_arguments_two: [],
        sending_a_message_with_arguments_three: [3, 4, nil, 6],
        sending_a_message_with_arguments_four: [3, 4, nil, 6],
        sending_undefined_messages_to_a_typical_object_results_in_errors_one: ::NoMethodError,
        calling_method_missing_causes_the_no_method_error_one: ::NoMethodError,
        all_messages_are_caught_one: 'Someone called foobar with <>',
        all_messages_are_caught_two: 'Someone called foobaz with <1>',
        all_messages_are_caught_three: 'Someone called sum with <1, 2, 3, 4, 5, 6>',
        catching_messages_makes_respond_to_lie_one: false,
        foo_method_are_caught_one: 'Foo to you too',
        foo_method_are_caught_two: 'Foo to you too',
        non_foo_messages_are_treated_normally_one: ::NoMethodError,
        explicitly_implementing_respond_to_lets_objects_tell_the_truth_one: true,
        explicitly_implementing_respond_to_lets_objects_tell_the_truth_two: false
      }
    end
  end
end
