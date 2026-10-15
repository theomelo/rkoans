# frozen_string_literal: true

require 'test_helper'
require 'tmpdir'

class AboutClassMethodsAcceptanceTest < Minitest::Test
  # Incorrect predictions must fail the examples they describe.
  def test_incorrect_predictions_are_rejected
    Dir.mktmpdir do |directory|
      exercise = Rkoans::Exercise.new(directory: directory, id: 'about-class-methods')
      exercise.prepare
      reference = File.read(exercise.reference)
      cases = [
        %w[objects_are_objects_one false test_objects_are_objects],
        %w[classes_are_classes_one false test_classes_are_classes]
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
