# frozen_string_literal: true

# The original descriptive check identifiers and example strings remain intact.
# Short parameter names match the small arithmetic or assignment examples.
# rubocop:disable Layout/LineLength, Naming/MethodParameterName

module Exercises
  # Implement ratios(a,b) returning integer division, floating division, and exact Rational division under keys integer, floating, rational.
  class NumericPrecision
    # Implements ratios.
    def self.ratios(a, b) = { integer: a / b, floating: a / b, rational: a / b }
    # Implements imaginary product.
    def self.imaginary_product(a, b) = Complex(a * b, 0)
  end
end

# rubocop:enable Layout/LineLength, Naming/MethodParameterName
