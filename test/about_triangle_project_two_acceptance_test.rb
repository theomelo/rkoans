# frozen_string_literal: true

require 'test_helper'
require 'tmpdir'

class AboutTriangleProjectTwoAcceptanceTest < Minitest::Test
  # A plausible partial implementation must fail a behavioral check, without errors.
  def test_incomplete_implementation_is_rejected
    Dir.mktmpdir do |directory|
      exercise = Rkoans::Exercise.new(directory: directory, id: 'about-triangle-project-two')
      exercise.prepare
      File.write(exercise.solution, File.read(exercise.reference) + <<~RUBY)
        module Exercises
          class AboutTriangleProjectTwo
            # A common mistake accepts a flat triangle at the equality boundary.
            def self.triangle(a, b, c)
              sides = [a, b, c].sort
              raise TriangleError if sides.first <= 0 || sides[0] + sides[1] < sides[2]

              :isosceles
            end
          end
        end
      RUBY
      result = Rkoans::Checker.new.run(exercise)

      assert_equal 1, result.exit_code, result.output
      assert_includes result.output, 'test_illegal_triangles_throw_exceptions'
      assert_includes result.output, '0 errors'
    end
  end
end
