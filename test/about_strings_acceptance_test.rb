# frozen_string_literal: true

require 'test_helper'
require 'tmpdir'

class AboutStringsAcceptanceTest < Minitest::Test
  # Mutation and identity predictions must be checked independently of other answers.
  def test_incorrect_mutation_and_identity_predictions_are_rejected
    Dir.mktmpdir do |directory|
      exercise = Rkoans::Exercise.new(directory: directory, id: 'about-strings')
      exercise.prepare
      reference = File.read(exercise.reference)
      cases = [
        ['appended_original', "'Hello, '", 'test_the_shovel_operator_modifies_the_original_string'],
        ['same_object', 'true', 'test_strings_are_unique_objects']
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
