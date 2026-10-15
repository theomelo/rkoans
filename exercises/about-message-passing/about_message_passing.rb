# frozen_string_literal: true

# SPDX-License-Identifier: CC-BY-NC-SA-3.0
# Adapted from Ruby Koans by Jim Weirich and Joe O'Brien.
# See THIRD_PARTY_NOTICES.md for attribution and license terms.

module Exercises
  # Predictions for message passing examples.
  class AboutMessagePassing
    # Replace each :fill_me_in with the result of the described expression.
    # @return [Hash<Symbol, Object>]
    # This method is an answer table, not a sequence of operations.
    def self.koans # rubocop:disable Metrics/MethodLength
      {
        # Methods can be invoked more dynamically.
        # mc = MessageCatcher.new
        # assert mc.send("caught?")
        # assert_equal __, mc.send("caught" + "?")    # What do you need to add to the first string?
        # assert_equal __, mc.send("CAUGHT?".downcase)
        # Predict: mc.send("caught" + "?")
        methods_can_be_invoked_more_dynamically_one: :fill_me_in,
        # Predict: mc.send("CAUGHT?".downcase)
        methods_can_be_invoked_more_dynamically_two: :fill_me_in,
        # Send with underscores will also send messages.
        # mc = MessageCatcher.new
        # assert_equal __, mc.__send__(:caught?)
        # Predict: mc.__send__(:caught?)
        send_with_underscores_will_also_send_messages_one: :fill_me_in,
        # Classes can be asked if they know how to respond.
        # mc = MessageCatcher.new
        # assert_equal __, mc.respond_to?(:caught?)
        # assert_equal __, mc.respond_to?(:does_not_exist)
        # Predict: mc.respond_to?(:caught?)
        classes_can_be_asked_if_they_know_how_to_respond_one: :fill_me_in,
        # Predict: mc.respond_to?(:does_not_exist)
        classes_can_be_asked_if_they_know_how_to_respond_two: :fill_me_in,
        # Sending a message with arguments.
        # mc = MessageCatcher.new
        # assert_equal __, mc.add_a_payload
        # assert_equal __, mc.send(:add_a_payload)
        # assert_equal __, mc.add_a_payload(3, 4, nil, 6)
        # assert_equal __, mc.send(:add_a_payload, 3, 4, nil, 6)
        # Predict: mc.add_a_payload
        sending_a_message_with_arguments_one: :fill_me_in,
        # Predict: mc.send(:add_a_payload)
        sending_a_message_with_arguments_two: :fill_me_in,
        # Predict: mc.add_a_payload(3, 4, nil, 6)
        sending_a_message_with_arguments_three: :fill_me_in,
        # Predict: mc.send(:add_a_payload, 3, 4, nil, 6)
        sending_a_message_with_arguments_four: :fill_me_in,
        # Sending undefined messages to a typical object results in errors.
        # typical = TypicalObject.new
        # exception = assert_raise(___) do
        # typical.foobar
        # end
        # assert_match(/foobar/, exception.message)
        # Predict: exception class from: typical.foobar
        sending_undefined_messages_to_a_typical_object_results_in_errors_one: :fill_me_in,
        # Calling method missing causes the no method error.
        # typical = TypicalObject.new
        # exception = assert_raise(___) do
        # typical.__send__(:method_missing, :foobar)
        # end
        # assert_match(/foobar/, exception.message)
        # Predict: exception class from: typical.__send__(:method_missing, :foobar)
        calling_method_missing_causes_the_no_method_error_one: :fill_me_in,
        # All messages are caught.
        # catcher = AllMessageCatcher.new
        # assert_equal __, catcher.foobar
        # assert_equal __, catcher.foobaz(1)
        # assert_equal __, catcher.sum(1,2,3,4,5,6)
        # Predict: catcher.foobar
        all_messages_are_caught_one: :fill_me_in,
        # Predict: catcher.foobaz(1)
        all_messages_are_caught_two: :fill_me_in,
        # Predict: catcher.sum(1,2,3,4,5,6)
        all_messages_are_caught_three: :fill_me_in,
        # Catching messages makes respond to lie.
        # catcher = AllMessageCatcher.new
        # assert_nothing_raised do
        # catcher.any_method
        # end
        # assert_equal __, catcher.respond_to?(:any_method)
        # Predict: catcher.respond_to?(:any_method)
        catching_messages_makes_respond_to_lie_one: :fill_me_in,
        # Foo method are caught.
        # catcher = WellBehavedFooCatcher.new
        # assert_equal __, catcher.foo_bar
        # assert_equal __, catcher.foo_baz
        # Predict: catcher.foo_bar
        foo_method_are_caught_one: :fill_me_in,
        # Predict: catcher.foo_baz
        foo_method_are_caught_two: :fill_me_in,
        # Non foo messages are treated normally.
        # catcher = WellBehavedFooCatcher.new
        # assert_raise(___) do
        # catcher.normal_undefined_method
        # end
        # Predict: exception class from: catcher.normal_undefined_method
        non_foo_messages_are_treated_normally_one: :fill_me_in,
        # Explicitly implementing respond to lets objects tell the truth.
        # catcher = WellBehavedFooCatcher.new
        # assert_equal __, catcher.respond_to?(:foo_bar)
        # assert_equal __, catcher.respond_to?(:something_else)
        # Predict: catcher.respond_to?(:foo_bar)
        explicitly_implementing_respond_to_lets_objects_tell_the_truth_one: :fill_me_in,
        # Predict: catcher.respond_to?(:something_else)
        explicitly_implementing_respond_to_lets_objects_tell_the_truth_two: :fill_me_in
      }
    end
  end
end
