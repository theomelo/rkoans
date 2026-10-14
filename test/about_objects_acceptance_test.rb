# frozen_string_literal: true

require 'test_helper'
require 'tmpdir'

class AboutObjectsAcceptanceTest < Minitest::Test
  # Conversion and cloning must reject plausible confusion with inspection and aliasing.
  def test_incorrect_nil_conversion_and_clone_predictions_are_rejected
    Dir.mktmpdir do |directory|
      exercise = Rkoans::Exercise.new(directory: directory, id: 'about-objects')
      exercise.prepare
      reference = File.read(exercise.reference)
      cases = [
        ['nil_string', "'nil'", 'test_objects_can_be_converted_to_strings'],
        %w[clone_distinct_id false test_clone_creates_a_different_object]
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
