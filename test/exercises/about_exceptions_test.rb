# frozen_string_literal: true

# Assignments before later reassignment or return are part of the experiment.
# Keep the original koan check name.
# This example deliberately raises an exception instance rather than a class and message pair.
# The examples demonstrate raise and fail as synonyms.
# rubocop:disable Lint/UselessAssignment, Naming/MethodName, Style/RaiseArgs, Style/SignalException

# SPDX-License-Identifier: CC-BY-NC-SA-3.0
# Adapted from Ruby Koans by Jim Weirich and Joe O'Brien.
# See THIRD_PARTY_NOTICES.md for attribution and license terms.

require ARGV.shift
class AboutExceptionsTest < Minitest::Test
  class MySpecialError < RuntimeError
  end

  # Checks exceptions inherit from Exception.
  def test_exceptions_inherit_from_Exception
    assert_equal Exercises::AboutExceptions.koans.fetch(:exceptions_inherit_from_Exception_one),
                 MySpecialError.ancestors[1]
    assert_equal Exercises::AboutExceptions.koans.fetch(:exceptions_inherit_from_Exception_two),
                 MySpecialError.ancestors[2]
    assert_equal Exercises::AboutExceptions.koans.fetch(:exceptions_inherit_from_Exception_three),
                 MySpecialError.ancestors[3]
    assert_equal Exercises::AboutExceptions.koans.fetch(:exceptions_inherit_from_Exception_four),
                 MySpecialError.ancestors[4]
  end

  # Checks rescue clause.
  def test_rescue_clause
    result = nil
    begin
      fail 'Oops'
    rescue StandardError => e
      result = :exception_handled
    end

    assert_equal Exercises::AboutExceptions.koans.fetch(:rescue_clause_one), result

    assert_equal Exercises::AboutExceptions.koans.fetch(:rescue_clause_two), e.is_a?(StandardError)
    assert_equal Exercises::AboutExceptions.koans.fetch(:rescue_clause_three), e.is_a?(RuntimeError)

    assert_includes RuntimeError.ancestors, StandardError,
                    'RuntimeError is a subclass of StandardError'

    assert_equal Exercises::AboutExceptions.koans.fetch(:rescue_clause_four), e.message
  end

  # Checks raising a particular error.
  def test_raising_a_particular_error
    result = nil
    begin
      # 'raise' and 'fail' are synonyms
      raise MySpecialError, 'My Message'
    rescue MySpecialError => e
      result = :exception_handled
    end

    assert_equal Exercises::AboutExceptions.koans.fetch(:raising_a_particular_error_one), result
    assert_equal Exercises::AboutExceptions.koans.fetch(:raising_a_particular_error_two), e.message
  end

  # Checks ensure clause.
  def test_ensure_clause
    result = nil
    begin
      fail 'Oops'
    rescue StandardError
      # no code here
    ensure
      result = :always_run
    end

    assert_equal Exercises::AboutExceptions.koans.fetch(:ensure_clause_one), result
  end

  # Sometimes, we must know about the unknown
  # Checks asserting an error is raised.
  def test_asserting_an_error_is_raised
    # A do-end is a block, a topic to explore more later
    assert_predicted_error(:asserting_an_error_is_raised_one, ::AboutExceptionsTest::MySpecialError) do
      raise MySpecialError.new('New instances can be raised directly.')
    end
  end

  # Checks the predicted exception class while returning the captured error.
  # @param key [Symbol] answer field
  # @param klass [Class<Exception>] exception raised by the example
  # @return [Exception]
  def assert_predicted_error(key, ...)
    error = assert_raises(...)
    assert_equal Exercises::AboutExceptions.koans.fetch(key), error.class
    error
  end
end

# rubocop:enable Lint/UselessAssignment, Naming/MethodName, Style/RaiseArgs, Style/SignalException
