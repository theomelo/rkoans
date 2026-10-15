# frozen_string_literal: true

# SPDX-License-Identifier: CC-BY-NC-SA-3.0
# Adapted from Ruby Koans by Jim Weirich and Joe O'Brien.
# See THIRD_PARTY_NOTICES.md for attribution and license terms.

module Exercises
  # Predictions for control statements examples.
  class AboutControlStatements
    # Replace each :fill_me_in with the result of the described expression.
    # @return [Hash<Symbol, Object>]
    # This method is an answer table, not a sequence of operations.
    def self.koans
      {
        # If then else statements.
        # if true
        # result = :true_value
        # else
        # result = :false_value
        # end
        # assert_equal __, result
        # Predict: result
        if_then_else_statements_one: :fill_me_in,
        # If then statements.
        # result = :default_value
        # if true
        # result = :true_value
        # end
        # assert_equal __, result
        # Predict: result
        if_then_statements_one: :fill_me_in,
        # If statements return values.
        # value = if true
        # :true_value
        # else
        # :false_value
        # end
        # assert_equal __, value
        # value = if false
        # :true_value
        # else
        # :false_value
        # end
        # assert_equal __, value
        # Predict: value
        if_statements_return_values_one: :fill_me_in,
        # Predict: value
        if_statements_return_values_two: :fill_me_in,
        # If statements with no else with false condition return value.
        # value = if false
        # :true_value
        # end
        # assert_equal __, value
        # Predict: value
        if_statements_with_no_else_with_false_condition_return_value_one: :fill_me_in,
        # Condition operators.
        # assert_equal __, (true ? :true_value : :false_value)
        # assert_equal __, (false ? :true_value : :false_value)
        # Predict: (true ? :true_value : :false_value)
        condition_operators_one: :fill_me_in,
        # Predict: (false ? :true_value : :false_value)
        condition_operators_two: :fill_me_in,
        # If statement modifiers.
        # result = :default_value
        # result = :true_value if true
        # assert_equal __, result
        # Predict: result
        if_statement_modifiers_one: :fill_me_in,
        # Unless statement.
        # result = :default_value
        # unless false    # same as saying 'if !false', which evaluates as 'if true'
        # result = :false_value
        # end
        # assert_equal __, result
        # Predict: result
        unless_statement_one: :fill_me_in,
        # Unless statement evaluate true.
        # result = :default_value
        # unless true    # same as saying 'if !true', which evaluates as 'if false'
        # result = :true_value
        # end
        # assert_equal __, result
        # Predict: result
        unless_statement_evaluate_true_one: :fill_me_in,
        # Unless statement modifier.
        # result = :default_value
        # result = :false_value unless false
        # assert_equal __, result
        # Predict: result
        unless_statement_modifier_one: :fill_me_in,
        # While statement.
        # i = 1
        # result = 1
        # while i <= 10
        # result = result * i
        # i += 1
        # end
        # assert_equal __, result
        # Predict: result
        while_statement_one: :fill_me_in,
        # Break statement.
        # i = 1
        # result = 1
        # while true
        # break unless i <= 10
        # result = result * i
        # i += 1
        # end
        # assert_equal __, result
        # Predict: result
        break_statement_one: :fill_me_in,
        # Break statement returns values.
        # i = 1
        # result = while i <= 10
        # break i if i % 2 == 0
        # i += 1
        # end
        # assert_equal __, result
        # Predict: result
        break_statement_returns_values_one: :fill_me_in,
        # Next statement.
        # i = 0
        # result = []
        # while i < 10
        # i += 1
        # next if (i % 2) == 0
        # result << i
        # end
        # assert_equal __, result
        # Predict: result
        next_statement_one: :fill_me_in,
        # For statement.
        # array = ["fish", "and", "chips"]
        # result = []
        # for item in array
        # result << item.upcase
        # end
        # assert_equal [__, __, __], result
        # Predict: result
        for_statement_one: :fill_me_in,
        # Times statement.
        # sum = 0
        # 10.times do
        # sum += 1
        # end
        # assert_equal __, sum
        # Predict: sum
        times_statement_one: :fill_me_in
      }
    end
  end
end
