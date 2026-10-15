# frozen_string_literal: true

require ARGV.shift
class NumberedParametersTest < Minitest::Test
  # Checks numbered pair input.
  def test_numbered_pair_input
    assert_equal [5, 9], Exercises::NumberedParameters.pair_sums([[2, 3], [4, 5]])
    assert_equal [], Exercises::NumberedParameters.pair_sums([])
  end

  # Checks numbered syntax.
  def test_numbered_syntax
    assert_equal({ explicit_and_numbered: false, numbered_pair: true }, Exercises::NumberedParameters.predictions)
  end
end
