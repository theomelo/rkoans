# frozen_string_literal: true

require 'test_helper'
require 'tmpdir'

class AboutArraysAcceptanceTest < Minitest::Test
  # Boundary slices and destructive operations must reject incorrect predictions.
  def test_incorrect_slice_and_pop_predictions_are_rejected
    Dir.mktmpdir do |directory|
      exercise = Rkoans::Exercise.new(directory: directory, id: 'about-arrays')
      exercise.prepare
      reference = File.read(exercise.reference)
      cases = [
        %w[slice_beyond_end [] test_slicing_arrays],
        ['after_pop', '[1, 2, :last]', 'test_pushing_and_popping_arrays']
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
