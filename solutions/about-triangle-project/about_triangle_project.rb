# frozen_string_literal: true

# SPDX-License-Identifier: CC-BY-NC-SA-3.0
# Adapted from Ruby Koans by Jim Weirich and Joe O'Brien.
# See THIRD_PARTY_NOTICES.md for attribution and license terms.

module Exercises
  # Classifies triangles by the number of equal sides.
  class AboutTriangleProject
    # @return [Symbol] :equilateral, :isosceles, or :scalene for valid side lengths
    def self.triangle(side_a, side_b, side_c)
      case [side_a, side_b, side_c].uniq.size
      when 1 then :equilateral
      when 2 then :isosceles
      else :scalene
      end
    end
  end
end
