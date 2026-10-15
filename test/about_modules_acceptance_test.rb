# frozen_string_literal: true

require 'test_helper'
require 'tmpdir'

class AboutModulesAcceptanceTest < Minitest::Test
  # Incorrect predictions must fail the examples they describe.
  def test_incorrect_predictions_are_rejected
    Dir.mktmpdir do |directory|
      exercise = Rkoans::Exercise.new(directory: directory, id: 'about-modules')
      exercise.prepare
      reference = File.read(exercise.reference)
      cases = [
        ['cant_instantiate_modules_one', 'ArgumentError', 'test_cant_instantiate_modules'],
        ['normal_methods_are_available_in_the_object_one', '"WOOF?"', 'test_normal_methods_are_available_in_the_object']
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
