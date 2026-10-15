# frozen_string_literal: true

require ARGV.shift
class ExceptionFlowTest < Minitest::Test
  # Checks ensure and else.
  def test_ensure_and_else
    assert_equal %w[work else ensure], Exercises::ExceptionFlow.trace(fail: false)

    assert_equal %w[work rescue ensure], Exercises::ExceptionFlow.trace(fail: true)
  end

  # Checks reraise.
  def test_reraise
    error = assert_raises(ArgumentError) { Exercises::ExceptionFlow.reraises }
    assert_equal 'original', error.message
  end
end
