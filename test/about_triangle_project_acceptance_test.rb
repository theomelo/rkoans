# frozen_string_literal: true

require 'test_helper'
require 'tmpdir'

class AboutTriangleProjectAcceptanceTest < Minitest::Test
  # A plausible partial implementation must fail a behavioral check, without errors.
  def test_incomplete_implementation_is_rejected
    Dir.mktmpdir do |directory|
      exercise = Rkoans::Exercise.new(directory: directory, id: 'about-triangle-project')
      exercise.prepare
      File.write(exercise.solution, File.read(exercise.reference) + <<~RUBY)
        module Exercises
          class AboutTriangleProject
            def self.triangle(a, b, c)
              return :equilateral if a == b && b == c
              a == b ? :isosceles : :scalene
            end
          end
        end
      RUBY
      result = Rkoans::Checker.new.run(exercise)

      assert_equal 1, result.exit_code, result.output
      assert_includes result.output, 'test_isosceles_triangles_have_exactly_two_sides_equal'
      assert_includes result.output, '0 errors'
    end
  end
end
