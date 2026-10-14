# frozen_string_literal: true

require ARGV.shift
class LiteralsAndOperatorsTest < Minitest::Test
  # Checks literals and precedence.
  def test_literals_and_precedence
    assert_equal({
                   zero_truthy: true,
                   integer_division: 2,
                   float_division: 2.5,
                   precedence: 7,
                   not_nil: true,
                   words: %w[ruby rails],
                   range: [1, 2, 3]
                 }, Exercises::LiteralsAndOperators.predictions)
  end

  # Checks short circuit default.
  def test_short_circuit_default
    assert_equal false, Exercises::LiteralsAndOperators.default_for_nil(false) # rubocop:disable Minitest/RefuteFalse

    assert_equal 0, Exercises::LiteralsAndOperators.default_for_nil(0)
    assert_equal 'missing', Exercises::LiteralsAndOperators.default_for_nil(nil)
  end
end
