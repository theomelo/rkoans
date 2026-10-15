# frozen_string_literal: true

require ARGV.shift
class NonlocalExitTest < Minitest::Test
  # Checks lambda return scope.
  def test_lambda_return_scope
    assert_equal %w[inside after], Exercises::NonlocalExit.lambda_trace
  end

  # Checks proc nonlocal return.
  def test_proc_nonlocal_return
    assert_raises(LocalJumpError) { Exercises::NonlocalExit.escaped_proc.call }
  end

  # Checks catch throw and next.
  def test_catch_throw_and_next
    assert_equal 4, Exercises::NonlocalExit.find_even([[1, 3], [4, 6]])
    assert_nil Exercises::NonlocalExit.find_even([[1], [3]])

    assert_equal [2, 4], Exercises::NonlocalExit.skip_odds([1, 2, 3, 4])
  end
end
