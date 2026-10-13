# frozen_string_literal: true

require 'test_helper'
require 'tmpdir'

class ReferenceSolutionsTest < Minitest::Test
  def test_each_reference_passes_its_exercise_checks
    Dir.mktmpdir do |directory|
      Rkoans::Exercise::IDS.each do |id|
        exercise = Rkoans::Exercise.new(directory: directory, id: id)
        exercise.prepare
        File.write(exercise.solution, File.read(exercise.reference))
        result = Rkoans::Checker.new.run(exercise)

        assert_equal 0, result.exit_code, result.output
      end
    end
  end
end
