# frozen_string_literal: true

# The original descriptive check identifiers and example strings remain intact.
# An empty class demonstrates construction without custom methods.
# The example deliberately contrasts received arguments with values actually used.
# The direct method call is compared with send and __send__ in this chapter.
# The block name is observable through parameter metadata or the explicit forwarding example.
# The exercise makes positional, keyword, and block forwarding visible.
# This catcher deliberately demonstrates misleading introspection.
# The dynamic message example constructs a method name from separate strings.
# Explicit forwarding makes the missing-method and visibility arguments visible.
# rubocop:disable Layout/LineLength, Lint/EmptyClass, Lint/UnusedMethodArgument, Minitest/AssertPredicate, Naming/BlockForwarding, Style/ArgumentsForwarding, Style/MissingRespondToMissing, Style/StringConcatenation, Style/SuperArguments

# SPDX-License-Identifier: CC-BY-NC-SA-3.0
# Adapted from Ruby Koans by Jim Weirich and Joe O'Brien.
# See THIRD_PARTY_NOTICES.md for attribution and license terms.

require ARGV.shift
class AboutMessagePassingTest < Minitest::Test
  class MessageCatcher
    # Demonstrates caught?.
    def caught?
      true
    end
  end

  # Checks methods can be called directly.
  def test_methods_can_be_called_directly
    mc = MessageCatcher.new

    assert mc.caught?
  end

  # Checks methods can be invoked by sending the message.
  def test_methods_can_be_invoked_by_sending_the_message
    mc = MessageCatcher.new

    assert mc.send(:caught?)
  end

  # Checks methods can be invoked more dynamically.
  def test_methods_can_be_invoked_more_dynamically
    mc = MessageCatcher.new

    assert mc.send('caught?')
    assert_equal Exercises::AboutMessagePassing.koans.fetch(:methods_can_be_invoked_more_dynamically_one), mc.send('caught' + '?') # What do you need to add to the first string?
    assert_equal Exercises::AboutMessagePassing.koans.fetch(:methods_can_be_invoked_more_dynamically_two), mc.send('CAUGHT?'.downcase) # What would you need to do to the string?
  end

  # Checks send with underscores will also send messages.
  def test_send_with_underscores_will_also_send_messages
    mc = MessageCatcher.new

    assert_equal Exercises::AboutMessagePassing.koans.fetch(:send_with_underscores_will_also_send_messages_one),
                 mc.__send__(:caught?)

    # THINK ABOUT IT:
    #
    # Why does Ruby provide both send and __send__ ?
  end

  # Checks classes can be asked if they know how to respond.
  def test_classes_can_be_asked_if_they_know_how_to_respond
    mc = MessageCatcher.new

    assert_equal Exercises::AboutMessagePassing.koans.fetch(:classes_can_be_asked_if_they_know_how_to_respond_one),
                 mc.respond_to?(:caught?)
    assert_equal Exercises::AboutMessagePassing.koans.fetch(:classes_can_be_asked_if_they_know_how_to_respond_two),
                 mc.respond_to?(:does_not_exist)
  end

  # ------------------------------------------------------------------

  class MessageCatcher
    # Demonstrates add a payload.
    def add_a_payload(*args)
      args
    end
  end

  # Checks sending a message with arguments.
  def test_sending_a_message_with_arguments
    mc = MessageCatcher.new

    assert_equal Exercises::AboutMessagePassing.koans.fetch(:sending_a_message_with_arguments_one), mc.add_a_payload
    assert_equal Exercises::AboutMessagePassing.koans.fetch(:sending_a_message_with_arguments_two),
                 mc.send(:add_a_payload)

    assert_equal Exercises::AboutMessagePassing.koans.fetch(:sending_a_message_with_arguments_three),
                 mc.add_a_payload(3, 4, nil, 6)
    assert_equal Exercises::AboutMessagePassing.koans.fetch(:sending_a_message_with_arguments_four),
                 mc.send(:add_a_payload, 3, 4, nil, 6)
  end

  # Message dispatch:
  #
  # Both obj.msg and obj.send(:msg) sends the message named :msg to
  # the object. We use "send" when the name of the message can vary
  # dynamically (e.g. calculated at run time), but by far the most
  # common way of sending a message is just to say: obj.msg.

  # ------------------------------------------------------------------

  class TypicalObject
  end

  # Checks sending undefined messages to a typical object results in errors.
  def test_sending_undefined_messages_to_a_typical_object_results_in_errors
    typical = TypicalObject.new

    exception = assert_predicted_error(:sending_undefined_messages_to_a_typical_object_results_in_errors_one,
                                       ::NoMethodError) do
      typical.foobar
    end
    assert_match(/foobar/, exception.message)
  end

  # Checks calling method missing causes the no method error.
  def test_calling_method_missing_causes_the_no_method_error
    typical = TypicalObject.new

    exception = assert_predicted_error(:calling_method_missing_causes_the_no_method_error_one, ::NoMethodError) do
      typical.__send__(:method_missing, :foobar)
    end
    assert_match(/foobar/, exception.message)

    # THINK ABOUT IT:
    #
    # If the method :method_missing causes the NoMethodError, then
    # what would happen if we redefine method_missing?
    #
  end

  # ------------------------------------------------------------------

  class AllMessageCatcher
    # Demonstrates method missing.
    def method_missing(method_name, *args, &block)
      "Someone called #{method_name} with <#{args.join(', ')}>"
    end
  end

  # Checks all messages are caught.
  def test_all_messages_are_caught
    catcher = AllMessageCatcher.new

    assert_equal Exercises::AboutMessagePassing.koans.fetch(:all_messages_are_caught_one), catcher.foobar
    assert_equal Exercises::AboutMessagePassing.koans.fetch(:all_messages_are_caught_two), catcher.foobaz(1)
    assert_equal Exercises::AboutMessagePassing.koans.fetch(:all_messages_are_caught_three),
                 catcher.sum(1, 2, 3, 4, 5, 6)
  end

  # Checks catching messages makes respond to lie.
  def test_catching_messages_makes_respond_to_lie
    catcher = AllMessageCatcher.new

    catcher.any_method

    assert_equal Exercises::AboutMessagePassing.koans.fetch(:catching_messages_makes_respond_to_lie_one),
                 catcher.respond_to?(:any_method)
  end

  # ------------------------------------------------------------------

  class WellBehavedFooCatcher
    # Demonstrates method missing.
    def method_missing(method_name, *args, &block)
      if method_name.to_s[0, 3] == 'foo'
        'Foo to you too'
      else
        super(method_name, *args, &block)
      end
    end
  end

  # Checks foo method are caught.
  def test_foo_method_are_caught
    catcher = WellBehavedFooCatcher.new

    assert_equal Exercises::AboutMessagePassing.koans.fetch(:foo_method_are_caught_one), catcher.foo_bar
    assert_equal Exercises::AboutMessagePassing.koans.fetch(:foo_method_are_caught_two), catcher.foo_baz
  end

  # Checks non foo messages are treated normally.
  def test_non_foo_messages_are_treated_normally
    catcher = WellBehavedFooCatcher.new

    assert_predicted_error(:non_foo_messages_are_treated_normally_one, ::NoMethodError) do
      catcher.normal_undefined_method
    end
  end

  # ------------------------------------------------------------------

  # (note: just reopening class from above)
  class WellBehavedFooCatcher
    private

    # Demonstrates respond to missing?.
    def respond_to_missing?(method_name, include_private = false)
      if method_name.to_s[0, 3] == 'foo'
        true
      else
        super(method_name, include_private)
      end
    end
  end

  # Checks explicitly implementing respond to lets objects tell the truth.
  def test_explicitly_implementing_respond_to_lets_objects_tell_the_truth
    catcher = WellBehavedFooCatcher.new

    assert_equal Exercises::AboutMessagePassing.koans.fetch(:explicitly_implementing_respond_to_lets_objects_tell_the_truth_one),
                 catcher.respond_to?(:foo_bar)
    assert_equal Exercises::AboutMessagePassing.koans.fetch(:explicitly_implementing_respond_to_lets_objects_tell_the_truth_two),
                 catcher.respond_to?(:something_else)
  end

  # Checks the predicted exception class while returning the captured error.
  # @param key [Symbol] answer field
  # @param klass [Class<Exception>] exception raised by the example
  # @return [Exception]
  def assert_predicted_error(key, ...)
    error = assert_raises(...)
    assert_equal Exercises::AboutMessagePassing.koans.fetch(key), error.class
    error
  end
end

# rubocop:enable Layout/LineLength, Lint/EmptyClass, Lint/UnusedMethodArgument, Minitest/AssertPredicate, Naming/BlockForwarding, Style/ArgumentsForwarding, Style/MissingRespondToMissing, Style/StringConcatenation, Style/SuperArguments
