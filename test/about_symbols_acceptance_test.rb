# frozen_string_literal: true

require 'test_helper'
require 'tmpdir'

class AboutSymbolsAcceptanceTest < Minitest::Test
  # Identity and unsupported-operation predictions must not pass with wrong answers.
  def test_incorrect_identity_and_exception_predictions_are_rejected
    Dir.mktmpdir do |directory|
      exercise = Rkoans::Exercise.new(directory: directory, id: 'about-symbols')
      exercise.prepare
      reference = File.read(exercise.reference)
      cases = [
        %w[same_object false test_identical_symbols_are_a_single_internal_object],
        %w[concatenation_error TypeError test_symbols_cannot_be_concatenated]
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
