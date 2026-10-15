# frozen_string_literal: true

# SPDX-License-Identifier: CC-BY-NC-SA-3.0
# Adapted from Ruby Koans by Jim Weirich and Joe O'Brien.
# See THIRD_PARTY_NOTICES.md for attribution and license terms.

module Exercises
  # Predictions for control statements examples.
  class AboutControlStatements
    # Returns reference predictions for the examples.
    # @return [Hash<Symbol, Object>]
    # This method is an answer table, not a sequence of operations.
    def self.koans
      {
        if_then_else_statements_one: :true_value,
        if_then_statements_one: :true_value,
        if_statements_return_values_one: :true_value,
        if_statements_return_values_two: :false_value,
        if_statements_with_no_else_with_false_condition_return_value_one: nil,
        condition_operators_one: :true_value,
        condition_operators_two: :false_value,
        if_statement_modifiers_one: :true_value,
        unless_statement_one: :false_value,
        unless_statement_evaluate_true_one: :default_value,
        unless_statement_modifier_one: :false_value,
        while_statement_one: 3_628_800,
        break_statement_one: 3_628_800,
        break_statement_returns_values_one: 2,
        next_statement_one: [1, 3, 5, 7, 9],
        for_statement_one: %w[FISH AND CHIPS],
        times_statement_one: 10
      }
    end
  end
end
