# frozen_string_literal: true

require ARGV.shift
class NumericPrecisionTest < Minitest::Test
  # Checks numeric division.
  def test_numeric_division
    r = Exercises::NumericPrecision.ratios(1, 3)

    assert_equal 0, r[:integer]

    assert_in_delta 1.0 / 3, r[:floating], 1e-12
    assert_equal Rational(4, 3), r[:rational] + 1
    assert_instance_of Rational, r[:rational]
  end

  # Checks complex product.
  def test_complex_product
    assert_equal Complex(-6, 0), Exercises::NumericPrecision.imaginary_product(2, 3)
  end
end
