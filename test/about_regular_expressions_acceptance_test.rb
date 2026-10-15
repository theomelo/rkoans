# frozen_string_literal: true

require 'test_helper'
require 'tmpdir'

class AboutRegularExpressionsAcceptanceTest < Minitest::Test
  # Incorrect predictions must fail the examples they describe.
  def test_incorrect_predictions_are_rejected
    Dir.mktmpdir do |directory|
      exercise = Rkoans::Exercise.new(directory: directory, id: 'about-regular-expressions')
      exercise.prepare
      reference = File.read(exercise.reference)
      cases = [
        ['a_failed_match_returns_nil_one', "''", 'test_a_failed_match_returns_nil'],
        ['slash_a_anchors_to_the_start_of_the_string_two', "''", 'test_slash_a_anchors_to_the_start_of_the_string']
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
