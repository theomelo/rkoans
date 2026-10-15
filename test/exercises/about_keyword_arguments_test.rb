# frozen_string_literal: true

# SPDX-License-Identifier: CC-BY-NC-SA-3.0
# Adapted from Ruby Koans by Jim Weirich and Joe O'Brien.
# See THIRD_PARTY_NOTICES.md for attribution and license terms.

require ARGV.shift
class AboutKeywordArgumentsTest < Minitest::Test
  # Demonstrates method with keyword arguments.
  def method_with_keyword_arguments(one: 1, two: 'two')
    [one, two]
  end

  # Checks keyword arguments.
  def test_keyword_arguments
    assert_equal Exercises::AboutKeywordArguments.koans.fetch(:keyword_arguments_one),
                 method_with_keyword_arguments.class
    assert_equal Exercises::AboutKeywordArguments.koans.fetch(:keyword_arguments_two), method_with_keyword_arguments
    assert_equal Exercises::AboutKeywordArguments.koans.fetch(:keyword_arguments_three),
                 method_with_keyword_arguments(one: 'one')
    assert_equal Exercises::AboutKeywordArguments.koans.fetch(:keyword_arguments_four),
                 method_with_keyword_arguments(two: 2)
  end

  # Demonstrates method with keyword arguments with mandatory argument.
  def method_with_keyword_arguments_with_mandatory_argument(one, two: 2, three: 3)
    [one, two, three]
  end

  # Checks keyword arguments with wrong number of arguments.
  def test_keyword_arguments_with_wrong_number_of_arguments
    exception = assert_predicted_error(:keyword_arguments_with_wrong_number_of_arguments_one, ::ArgumentError) do
      method_with_keyword_arguments_with_mandatory_argument
    end
    assert_predicted_message(:keyword_arguments_with_wrong_number_of_arguments_two, exception.message)
  end

  # Demonstrates method with mandatory keyword arguments.
  def method_with_mandatory_keyword_arguments(one:, two: 'two')
    [one, two]
  end

  # Checks mandatory keyword arguments.
  def test_mandatory_keyword_arguments
    assert_equal Exercises::AboutKeywordArguments.koans.fetch(:mandatory_keyword_arguments_one),
                 method_with_mandatory_keyword_arguments(one: 'one')
    assert_equal Exercises::AboutKeywordArguments.koans.fetch(:mandatory_keyword_arguments_two),
                 method_with_mandatory_keyword_arguments(two: 2, one: 1)
  end

  # Checks mandatory keyword arguments without mandatory argument.
  def test_mandatory_keyword_arguments_without_mandatory_argument
    exception = assert_predicted_error(:mandatory_keyword_arguments_without_mandatory_argument_one, ::ArgumentError) do
      method_with_mandatory_keyword_arguments
    end
    assert_predicted_message(:mandatory_keyword_arguments_without_mandatory_argument_two, exception.message)
  end

  # Checks the predicted exception class while returning the captured error.
  # @param key [Symbol] answer field
  # @param klass [Class<Exception>] exception raised by the example
  # @return [Exception]
  def assert_predicted_error(key, ...)
    error = assert_raises(...)
    assert_equal Exercises::AboutKeywordArguments.koans.fetch(key), error.class
    error
  end

  # Checks a nonempty literal fragment without depending on full diagnostic formatting.
  # @param key [Symbol] answer field
  # @param message [String] observed exception message
  # @return [void]
  def assert_predicted_message(key, message)
    fragment = Exercises::AboutKeywordArguments.koans.fetch(key)

    assert_kind_of String, fragment
    refute_empty fragment
    assert_includes message, fragment
  end
end
