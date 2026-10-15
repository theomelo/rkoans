# frozen_string_literal: true

# SPDX-License-Identifier: CC-BY-NC-SA-3.0
# Adapted from Ruby Koans by Jim Weirich and Joe O'Brien.
# See THIRD_PARTY_NOTICES.md for attribution and license terms.

require ARGV.shift

class AboutTriangleProjectTest < Minitest::Test
  # All equal sides make an equilateral triangle, regardless of scale.
  def test_equilateral_triangles_have_equal_sides
    assert_equal :equilateral, Exercises::AboutTriangleProject.triangle(2, 2, 2)
    assert_equal :equilateral, Exercises::AboutTriangleProject.triangle(10, 10, 10)
  end

  # The equal pair may appear in any positions.
  def test_isosceles_triangles_have_exactly_two_sides_equal
    [[3, 4, 4], [4, 3, 4], [4, 4, 3], [10, 10, 2]].each do |sides|
      assert_equal :isosceles, Exercises::AboutTriangleProject.triangle(*sides)
    end
  end

  # Distinct valid sides make a scalene triangle.
  def test_scalene_triangles_have_no_equal_sides
    [[3, 4, 5], [10, 11, 12], [5, 4, 2]].each do |sides|
      assert_equal :scalene, Exercises::AboutTriangleProject.triangle(*sides)
    end
  end
end
