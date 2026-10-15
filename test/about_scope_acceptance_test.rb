# frozen_string_literal: true

require 'test_helper'
require 'tmpdir'

class AboutScopeAcceptanceTest < Minitest::Test
  # Incorrect predictions must fail the examples they describe.
  def test_incorrect_predictions_are_rejected
    Dir.mktmpdir do |directory|
      exercise = Rkoans::Exercise.new(directory: directory, id: 'about-scope')
      exercise.prepare
      reference = File.read(exercise.reference)
      cases = [
        %w[dog_is_not_available_in_the_current_scope_one ArgumentError
           test_dog_is_not_available_in_the_current_scope],
        %w[you_can_reference_nested_classes_using_the_scope_operator_three false
           test_you_can_reference_nested_classes_using_the_scope_operator]
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
