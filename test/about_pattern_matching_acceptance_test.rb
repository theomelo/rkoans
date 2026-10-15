# frozen_string_literal: true

require 'test_helper'
require 'tmpdir'

class AboutPatternMatchingAcceptanceTest < Minitest::Test
  # Incorrect predictions must fail the examples they describe.
  def test_incorrect_predictions_are_rejected
    Dir.mktmpdir do |directory|
      exercise = Rkoans::Exercise.new(directory: directory, id: 'about-pattern-matching')
      exercise.prepare
      reference = File.read(exercise.reference)
      cases = [
        ['pattern_may_not_match_one', 'ArgumentError', 'test_pattern_may_not_match'],
        ['we_can_use_else_one', '"incorrect prediction"', 'test_we_can_use_else']
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
