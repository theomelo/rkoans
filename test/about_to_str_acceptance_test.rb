# frozen_string_literal: true

require 'test_helper'
require 'tmpdir'

class AboutToStrAcceptanceTest < Minitest::Test
  # Incorrect predictions must fail the examples they describe.
  def test_incorrect_predictions_are_rejected
    Dir.mktmpdir do |directory|
      exercise = Rkoans::Exercise.new(directory: directory, id: 'about-to-str')
      exercise.prepare
      reference = File.read(exercise.reference)
      cases = [
        %w[normally_objects_cannot_be_used_where_strings_are_expected_one ArgumentError
           test_normally_objects_cannot_be_used_where_strings_are_expected],
        %w[to_str_allows_objects_to_be_treated_as_strings_one true
           test_to_str_allows_objects_to_be_treated_as_strings]
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
