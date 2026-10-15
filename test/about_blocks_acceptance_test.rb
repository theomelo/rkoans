# frozen_string_literal: true

require 'test_helper'
require 'tmpdir'

class AboutBlocksAcceptanceTest < Minitest::Test
  # Incorrect predictions must fail the examples they describe.
  def test_incorrect_predictions_are_rejected
    Dir.mktmpdir do |directory|
      exercise = Rkoans::Exercise.new(directory: directory, id: 'about-blocks')
      exercise.prepare
      reference = File.read(exercise.reference)
      cases = [
        %w[methods_can_take_blocks_one 4 test_methods_can_take_blocks],
        %w[blocks_can_be_defined_with_do_end_too_one 4 test_blocks_can_be_defined_with_do_end_too]
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
