# frozen_string_literal: true

require 'test_helper'
require 'tmpdir'

class AboutExceptionsAcceptanceTest < Minitest::Test
  # Incorrect predictions must fail the examples they describe.
  def test_incorrect_predictions_are_rejected
    Dir.mktmpdir do |directory|
      exercise = Rkoans::Exercise.new(directory: directory, id: 'about-exceptions')
      exercise.prepare
      reference = File.read(exercise.reference)
      cases = [
        %w[rescue_clause_two false test_rescue_clause],
        %w[asserting_an_error_is_raised_one ArgumentError test_asserting_an_error_is_raised]
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
