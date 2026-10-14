# frozen_string_literal: true

require 'test_helper'
require 'tmpdir'

class AboutNilAcceptanceTest < Minitest::Test
  # A wrong error class and a vacuous message prediction must not pass.
  def test_incorrect_error_and_empty_message_predictions_are_rejected
    Dir.mktmpdir do |directory|
      exercise = Rkoans::Exercise.new(directory: directory, id: 'about-nil')
      exercise.prepare
      reference = File.read(exercise.reference)
      cases = [
        %w[missing_method_error TypeError],
        ['message_fragment', "''"]
      ]
      cases.each do |key, answer|
        File.write(exercise.solution, reference.sub(/#{key}: .*/, "#{key}: #{answer},"))
        result = Rkoans::Checker.new.run(exercise)

        assert_equal 1, result.exit_code, result.output
        assert_includes result.output, 'test_you_dont_get_null_pointer_errors_when_calling_methods_on_nil'
        assert_includes result.output, '1 failures'
      end
    end
  end
end
