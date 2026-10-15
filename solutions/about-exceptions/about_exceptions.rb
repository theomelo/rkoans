# frozen_string_literal: true

# SPDX-License-Identifier: CC-BY-NC-SA-3.0
# Adapted from Ruby Koans by Jim Weirich and Joe O'Brien.
# See THIRD_PARTY_NOTICES.md for attribution and license terms.

module Exercises
  # Predictions for exceptions examples.
  class AboutExceptions
    # Returns reference predictions for the examples.
    # @return [Hash<Symbol, Object>]
    # This method is an answer table, not a sequence of operations.
    def self.koans
      {
        exceptions_inherit_from_Exception_one: ::RuntimeError,
        exceptions_inherit_from_Exception_two: ::StandardError,
        exceptions_inherit_from_Exception_three: ::Exception,
        exceptions_inherit_from_Exception_four: ::Object,
        rescue_clause_one: :exception_handled,
        rescue_clause_two: true,
        rescue_clause_three: true,
        rescue_clause_four: 'Oops',
        raising_a_particular_error_one: :exception_handled,
        raising_a_particular_error_two: 'My Message',
        ensure_clause_one: :always_run,
        asserting_an_error_is_raised_one: ::AboutExceptionsTest::MySpecialError
      }
    end
  end
end
