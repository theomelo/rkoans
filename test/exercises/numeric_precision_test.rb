# frozen_string_literal: true

require ARGV.shift
class NumericPrecisionTest < Minitest::Test
  # Checks numeric division.
  def test_numeric_division
    result = Exercises::NumericPrecision.ratios(1, 3)

    assert_instance_of Integer, result[:integer]
    assert_equal 0, result[:integer]
    assert_instance_of Float, result[:floating]
    assert_in_delta 1.0 / 3, result[:floating], 1e-12
    assert_instance_of Rational, result[:rational]
    assert_equal Rational(4, 3), result[:rational] + 1
  end

  # Checks complex product.
  def test_complex_product
    product = Exercises::NumericPrecision.imaginary_product(2, 3)

    assert_instance_of Complex, product
    assert_equal Complex(-6, 0), product
  end
end
