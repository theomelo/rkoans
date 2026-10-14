# frozen_string_literal: true

require ARGV.shift

# Checks mutable rows with independent values, including repeated calls.
class SharedRowsTest < Minitest::Test
  # Changing either row leaves the other rows untouched.
  def test_independent_rows
    rows = Exercises::SharedRows.rows(3)
    rows[0] << :ruby

    assert_equal [[:ruby], [], []], rows

    rows[1] << :rails

    assert_equal [[:ruby], [:rails], []], rows
  end

  # Zero, one, and several rows preserve the requested shape.
  def test_empty_rows
    assert_equal [], Exercises::SharedRows.rows(0)
    assert_equal [[]], Exercises::SharedRows.rows(1)
    assert_equal [[], [], [], []], Exercises::SharedRows.rows(4)
  end

  # Each call owns its rows rather than returning cached mutable containers.
  def test_fresh_rows_on_each_call
    first = Exercises::SharedRows.rows(2)
    second = Exercises::SharedRows.rows(2)
    first[0] << :ruby

    assert_equal [[], []], second
  end
end
