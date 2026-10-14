# frozen_string_literal: true

require 'test_helper'
require 'tmpdir'

class AboutHashesAcceptanceTest < Minitest::Test
  # Incorrect predictions must fail the examples they describe.
  def test_incorrect_predictions_are_rejected
    Dir.mktmpdir do |directory|
      exercise = Rkoans::Exercise.new(directory: directory, id: 'about-hashes')
      exercise.prepare
      reference = File.read(exercise.reference)
      cases = [
        ['accessing_hashes_three', "''", 'test_accessing_hashes'],
        ['accessing_hashes_with_fetch_two', 'NoMethodError', 'test_accessing_hashes_with_fetch']
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
