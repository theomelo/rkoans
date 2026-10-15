# frozen_string_literal: true

require 'test_helper'
require 'tmpdir'

class AboutIterationAcceptanceTest < Minitest::Test
  # Incorrect predictions must fail the examples they describe.
  def test_incorrect_predictions_are_rejected
    Dir.mktmpdir do |directory|
      exercise = Rkoans::Exercise.new(directory: directory, id: 'about-iteration')
      exercise.prepare
      reference = File.read(exercise.reference)
      cases = [
        %w[break_works_with_each_style_iterations_one 55 test_break_works_with_each_style_iterations],
        ['all_iteration_methods_work_on_any_collection_not_just_arrays_two',
         '["THIS\\n", "IS\\n", "A\\n", "TEST\\n"]',
         'test_all_iteration_methods_work_on_any_collection_not_just_arrays']
      ]
      cases.each do |key, answer, check|
        File.write(exercise.solution, reference.sub(/#{key}: .*/, "#{key}: #{answer},"))
        result = Rkoans::Checker.new.run(exercise)

        assert_equal 1, result.exit_code, result.output
        assert_includes result.output, check
      end
    end
  end
end
