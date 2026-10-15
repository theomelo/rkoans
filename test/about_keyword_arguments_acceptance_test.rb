# frozen_string_literal: true

require 'test_helper'
require 'tmpdir'

class AboutKeywordArgumentsAcceptanceTest < Minitest::Test
  # Incorrect predictions must fail the examples they describe.
  def test_incorrect_predictions_are_rejected
    Dir.mktmpdir do |directory|
      exercise = Rkoans::Exercise.new(directory: directory, id: 'about-keyword-arguments')
      exercise.prepare
      reference = File.read(exercise.reference)
      cases = [
        %w[keyword_arguments_with_wrong_number_of_arguments_one TypeError
           test_keyword_arguments_with_wrong_number_of_arguments],
        %w[mandatory_keyword_arguments_without_mandatory_argument_one TypeError
           test_mandatory_keyword_arguments_without_mandatory_argument]
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
