# frozen_string_literal: true

require 'test_helper'
require 'tmpdir'

class AboutArrayAssignmentAcceptanceTest < Minitest::Test
  # Collecting excess values and filling missing ones are distinct assignment rules.
  def test_incorrect_splat_and_missing_value_predictions_are_rejected
    Dir.mktmpdir do |directory|
      exercise = Rkoans::Exercise.new(directory: directory, id: 'about-array-assignment')
      exercise.prepare
      reference = File.read(exercise.reference)
      cases = [
        ['splat_last', "'Smith'", 'test_parallel_assignments_with_splat_operator'],
        %w[short_last [] test_parallel_assignments_with_too_few_values]
      ]
      cases.each do |key, answer, check|
        File.write(exercise.solution, reference.sub(/#{key}: .*/, "#{key}: #{answer},"))
        result = Rkoans::Checker.new.run(exercise)

        assert_equal 1, result.exit_code, result.output
        assert_includes result.output, check
        assert_includes result.output, '1 failures'
      end
    end
  end
end
