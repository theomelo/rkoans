# frozen_string_literal: true

# SPDX-License-Identifier: CC-BY-NC-SA-3.0
# Adapted from Ruby Koans by Jim Weirich and Joe O'Brien.
# See THIRD_PARTY_NOTICES.md for attribution and license terms.

require ARGV.shift

class AboutTriangleProjectTwoTest < Minitest::Test
  # Reject nonpositive lengths and both sides of the triangle-inequality boundary.
  def test_illegal_triangles_throw_exceptions
    [[0, 0, 0], [3, 4, -5], [1, 1, 3], [2, 4, 2], [0, 1, 1]].each do |sides|
      sides.permutation.to_a.uniq.each do |ordered|
        assert_raises(Exercises::AboutTriangleProjectTwo::TriangleError) do
          Exercises::AboutTriangleProjectTwo.triangle(*ordered)
        end
      end
    end
  end

  # Validation must preserve the classification behavior from part one.
  def test_valid_triangles_keep_their_classification
    assert_equal :equilateral, Exercises::AboutTriangleProjectTwo.triangle(2, 2, 2)
    assert_equal :isosceles, Exercises::AboutTriangleProjectTwo.triangle(3, 4, 4)
    assert_equal :scalene, Exercises::AboutTriangleProjectTwo.triangle(3, 4, 5)
    assert_equal :isosceles, Exercises::AboutTriangleProjectTwo.triangle(1, 1, 1.5)
  end
end
