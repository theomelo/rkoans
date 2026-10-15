# frozen_string_literal: true

# Literal conditions isolate the control-flow behavior being predicted.
# Keep the related original chapter examples together.
# Separate conditional and assignment forms are deliberately contrasted.
# The example deliberately uses for rather than a block iterator.
# Full conditionals distinguish statement forms from modifiers.
# The example demonstrates break inside a while loop.
# rubocop:disable Lint/LiteralAsCondition, Metrics/ClassLength, Style/ConditionalAssignment, Style/For, Style/IfUnlessModifier, Style/InfiniteLoop

# SPDX-License-Identifier: CC-BY-NC-SA-3.0
# Adapted from Ruby Koans by Jim Weirich and Joe O'Brien.
# See THIRD_PARTY_NOTICES.md for attribution and license terms.

require ARGV.shift
class AboutControlStatementsTest < Minitest::Test
  # Checks if then else statements.
  def test_if_then_else_statements
    if true
      result = :true_value
    else
      result = :false_value
    end

    assert_equal Exercises::AboutControlStatements.koans.fetch(:if_then_else_statements_one), result
  end

  # Checks if then statements.
  def test_if_then_statements
    result = :default_value
    if true
      result = :true_value
    end

    assert_equal Exercises::AboutControlStatements.koans.fetch(:if_then_statements_one), result
  end

  # Checks if statements return values.
  def test_if_statements_return_values
    value = if true
              :true_value
            else
              :false_value
            end

    assert_equal Exercises::AboutControlStatements.koans.fetch(:if_statements_return_values_one), value

    value = if false
              :true_value
            else
              :false_value
            end

    assert_equal Exercises::AboutControlStatements.koans.fetch(:if_statements_return_values_two), value

    # NOTE: Actually, EVERY statement in Ruby will return a value, not
    # just if statements.
  end

  # Checks if statements with no else with false condition return value.
  def test_if_statements_with_no_else_with_false_condition_return_value
    value = if false
              :true_value
            end

    assert_equal Exercises::AboutControlStatements.koans.fetch(:if_statements_with_no_else_with_false_condition_return_value_one),
                 value
  end

  # Checks condition operators.
  def test_condition_operators
    assert_equal Exercises::AboutControlStatements.koans.fetch(:condition_operators_one),
                 ((true ? :true_value : :false_value))
    assert_equal Exercises::AboutControlStatements.koans.fetch(:condition_operators_two),
                 ((false ? :true_value : :false_value))
  end

  # Checks if statement modifiers.
  def test_if_statement_modifiers
    result = :default_value
    result = :true_value if true

    assert_equal Exercises::AboutControlStatements.koans.fetch(:if_statement_modifiers_one), result
  end

  # Checks unless statement.
  def test_unless_statement
    result = :default_value
    unless false # same as saying 'if !false', which evaluates as 'if true'
      result = :false_value
    end

    assert_equal Exercises::AboutControlStatements.koans.fetch(:unless_statement_one), result
  end

  # Checks unless statement evaluate true.
  def test_unless_statement_evaluate_true
    result = :default_value
    unless true # same as saying 'if !true', which evaluates as 'if false'
      result = :true_value
    end

    assert_equal Exercises::AboutControlStatements.koans.fetch(:unless_statement_evaluate_true_one), result
  end

  # Checks unless statement modifier.
  def test_unless_statement_modifier
    result = :default_value
    result = :false_value unless false

    assert_equal Exercises::AboutControlStatements.koans.fetch(:unless_statement_modifier_one), result
  end

  # Checks while statement.
  def test_while_statement
    i = 1
    result = 1
    while i <= 10
      result *= i
      i += 1
    end

    assert_equal Exercises::AboutControlStatements.koans.fetch(:while_statement_one), result
  end

  # Checks break statement.
  def test_break_statement
    i = 1
    result = 1
    while true
      break unless i <= 10

      result *= i
      i += 1
    end

    assert_equal Exercises::AboutControlStatements.koans.fetch(:break_statement_one), result
  end

  # Checks break statement returns values.
  def test_break_statement_returns_values
    i = 1
    result = while i <= 10
               break i if i.even?

               i += 1
             end

    assert_equal Exercises::AboutControlStatements.koans.fetch(:break_statement_returns_values_one), result
  end

  # Checks next statement.
  def test_next_statement
    i = 0
    result = []
    while i < 10
      i += 1
      next if i.even?

      result << i
    end

    assert_equal Exercises::AboutControlStatements.koans.fetch(:next_statement_one), result
  end

  # Checks for statement.
  def test_for_statement
    array = %w[fish and chips]
    result = []
    for item in array
      result << item.upcase
    end

    assert_equal Exercises::AboutControlStatements.koans.fetch(:for_statement_one), result
  end

  # Checks times statement.
  def test_times_statement
    sum = 0
    10.times do
      sum += 1
    end

    assert_equal Exercises::AboutControlStatements.koans.fetch(:times_statement_one), sum
  end
end

# rubocop:enable Lint/LiteralAsCondition, Metrics/ClassLength, Style/ConditionalAssignment, Style/For, Style/IfUnlessModifier, Style/InfiniteLoop
