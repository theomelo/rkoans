# frozen_string_literal: true

require 'test_helper'
require 'tmpdir'

class AboutClassesAcceptanceTest < Minitest::Test
  # Incorrect predictions must fail the examples they describe.
  def test_incorrect_predictions_are_rejected
    Dir.mktmpdir do |directory|
      exercise = Rkoans::Exercise.new(directory: directory, id: 'about-classes')
      exercise.prepare
      reference = File.read(exercise.reference)
      cases = [
        %w[instance_variables_cannot_be_accessed_outside_the_class_one ArgumentError
           test_instance_variables_cannot_be_accessed_outside_the_class],
        %w[args_to_new_must_match_initialize_one TypeError test_args_to_new_must_match_initialize]
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
