# frozen_string_literal: true

# SPDX-License-Identifier: CC-BY-NC-SA-3.0
# Adapted from Ruby Koans by Jim Weirich and Joe O'Brien.
# See THIRD_PARTY_NOTICES.md for attribution and license terms.

module Exercises
  # Predictions for exceptions examples.
  class AboutExceptions
    # Replace each :fill_me_in with the result of the described expression.
    # @return [Hash<Symbol, Object>]
    # This method is an answer table, not a sequence of operations.
    def self.koans
      {
        # Exceptions inherit from exception.
        # assert_equal __, MySpecialError.ancestors[1]
        # assert_equal __, MySpecialError.ancestors[2]
        # assert_equal __, MySpecialError.ancestors[3]
        # assert_equal __, MySpecialError.ancestors[4]
        # Predict: MySpecialError.ancestors[1]
        exceptions_inherit_from_Exception_one: :fill_me_in,
        # Predict: MySpecialError.ancestors[2]
        exceptions_inherit_from_Exception_two: :fill_me_in,
        # Predict: MySpecialError.ancestors[3]
        exceptions_inherit_from_Exception_three: :fill_me_in,
        # Predict: MySpecialError.ancestors[4]
        exceptions_inherit_from_Exception_four: :fill_me_in,
        # Rescue clause.
        # result = nil
        # begin
        # fail "Oops"
        # rescue StandardError => ex
        # result = :exception_handled
        # end
        # assert_equal __, result
        # assert_equal __, ex.is_a?(StandardError), "Should be a Standard Error"
        # assert_equal __, ex.is_a?(RuntimeError),  "Should be a Runtime Error"
        # assert RuntimeError.ancestors.include?(StandardError),
        # "RuntimeError is a subclass of StandardError"
        # assert_equal __, ex.message
        # Predict: result
        rescue_clause_one: :fill_me_in,
        # Predict: ex.is_a?(StandardError)
        rescue_clause_two: :fill_me_in,
        # Predict: ex.is_a?(RuntimeError)
        rescue_clause_three: :fill_me_in,
        # Predict: ex.message
        rescue_clause_four: :fill_me_in,
        # Raising a particular error.
        # result = nil
        # begin
        # 'raise' and 'fail' are synonyms
        # raise MySpecialError, "My Message"
        # rescue MySpecialError => ex
        # result = :exception_handled
        # end
        # assert_equal __, result
        # assert_equal __, ex.message
        # Predict: result
        raising_a_particular_error_one: :fill_me_in,
        # Predict: ex.message
        raising_a_particular_error_two: :fill_me_in,
        # Ensure clause.
        # result = nil
        # begin
        # fail "Oops"
        # rescue StandardError
        # no code here
        # ensure
        # result = :always_run
        # end
        # assert_equal __, result
        # Predict: result
        ensure_clause_one: :fill_me_in,
        # Asserting an error is raised.
        # assert_raise(___) do
        # raise MySpecialError.new("New instances can be raised directly.")
        # end
        # Predict: exception class from: raise MySpecialError.new("New instances can be raised directly.")
        asserting_an_error_is_raised_one: :fill_me_in
      }
    end
  end
end
