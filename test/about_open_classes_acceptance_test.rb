# frozen_string_literal: true

require 'test_helper'
require 'tmpdir'

class AboutOpenClassesAcceptanceTest < Minitest::Test
  # Incorrect predictions must fail the examples they describe.
  def test_incorrect_predictions_are_rejected
    Dir.mktmpdir do |directory|
      exercise = Rkoans::Exercise.new(directory: directory, id: 'about-open-classes')
      exercise.prepare
      reference = File.read(exercise.reference)
      cases = [
        ['even_existing_built_in_classes_can_be_reopened_one', 'true',
         'test_even_existing_built_in_classes_can_be_reopened'],
        ['as_defined_dogs_do_bark_one', '"WOOF?"', 'test_as_defined_dogs_do_bark']
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
