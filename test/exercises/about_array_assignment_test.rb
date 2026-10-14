# frozen_string_literal: true

# SPDX-License-Identifier: CC-BY-NC-SA-3.0
# Adapted from Ruby Koans by Jim Weirich and Joe O'Brien.
# See THIRD_PARTY_NOTICES.md for attribution and license terms.

# Preserve assignment syntax rather than rewriting the expressions being taught.
# rubocop:disable Style/WordArray, Style/ParallelAssignment

require ARGV.shift

# Observes how assignment distributes, collects, and preserves array values.
class AboutArrayAssignmentTest < Minitest::Test
  # Assigning to one variable keeps the entire array.
  def test_non_parallel_assignment
    names = ['John', 'Smith']
    answers = Exercises::AboutArrayAssignment.koans

    assert_equal answers[:names], names
  end

  # Parallel assignment distributes values in order.
  def test_parallel_assignments
    first_name, last_name = ['John', 'Smith']
    answers = Exercises::AboutArrayAssignment.koans

    assert_equal answers[:first_name], first_name
    assert_equal answers[:last_name], last_name
  end

  # Extra values are discarded without a splat.
  def test_parallel_assignments_with_extra_values
    first_name, last_name = ['John', 'Smith', 'III']
    answers = Exercises::AboutArrayAssignment.koans

    assert_equal answers[:extra_first], first_name
    assert_equal answers[:extra_last], last_name
  end

  # A splat collects the remaining values in an array.
  def test_parallel_assignments_with_splat_operator
    first_name, *last_name = ['John', 'Smith', 'III']
    answers = Exercises::AboutArrayAssignment.koans

    assert_equal answers[:splat_first], first_name
    assert_equal answers[:splat_last], last_name
  end

  # Missing values become nil.
  def test_parallel_assignments_with_too_few_values
    first_name, last_name = ['Cher']
    answers = Exercises::AboutArrayAssignment.koans

    assert_equal answers[:short_first], first_name
    assert_equal answers[:short_last], last_name
  end

  # An inner array remains a single assigned value.
  def test_parallel_assignments_with_subarrays
    first_name, last_name = [['Willie', 'Rae'], 'Johnson']
    answers = Exercises::AboutArrayAssignment.koans

    assert_equal answers[:nested_first], first_name
    assert_equal answers[:nested_last], last_name
  end

  # A trailing comma requests parallel assignment with one variable.
  def test_parallel_assignment_with_one_variable
    first_name, = ['John', 'Smith']
    answers = Exercises::AboutArrayAssignment.koans

    assert_equal answers[:single_first], first_name
  end

  # Right-hand values are evaluated before the assignments.
  def test_swapping_with_parallel_assignment
    first_name = 'Roy'
    last_name = 'Rob'
    first_name, last_name = last_name, first_name
    answers = Exercises::AboutArrayAssignment.koans

    assert_equal answers[:swapped_first], first_name
    assert_equal answers[:swapped_last], last_name
  end
end

# rubocop:enable Style/WordArray, Style/ParallelAssignment
