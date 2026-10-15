# frozen_string_literal: true

# The examples contrast block forms and their behavior.
# rubocop:disable Style/BlockDelimiters

require ARGV.shift
class ClosureCaptureTest < Minitest::Test
  # Checks separate captures.
  def test_separate_captures
    functions = Exercises::ClosureCapture.multipliers([2, 3, 4])

    assert_equal([10, 15, 20], functions.map { |f|
      f.call(5)
    })
  end

  # Checks lambda contract.
  def test_lambda_contract
    f = Exercises::ClosureCapture.multipliers([2]).first

    assert_predicate f, :lambda?
    assert_raises(ArgumentError) {
      f.call(5, 6)
    }
    assert_equal [], Exercises::ClosureCapture.multipliers([])
  end
end

# rubocop:enable Style/BlockDelimiters
