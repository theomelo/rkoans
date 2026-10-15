# frozen_string_literal: true

# SPDX-License-Identifier: CC-BY-NC-SA-3.0
# Adapted from Ruby Koans by Jim Weirich and Joe O'Brien.
# See THIRD_PARTY_NOTICES.md for attribution and license terms.

module Exercises
  # Adds exception handling to triangle classification.
  class AboutTriangleProjectTwo
    class TriangleError < StandardError; end

    # @raise [TriangleError] nonpositive or degenerate side lengths
    # @return [Symbol] triangle classification
    def self.triangle(side_a, side_b, side_c)
      sides = [side_a, side_b, side_c].sort
      raise TriangleError, 'invalid triangle' if sides.first <= 0 || sides[0] + sides[1] <= sides[2]

      case sides.uniq.size
      when 1 then :equilateral
      when 2 then :isosceles
      else :scalene
      end
    end
  end
end
