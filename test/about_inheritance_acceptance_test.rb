# frozen_string_literal: true

require 'test_helper'
require 'tmpdir'

class AboutInheritanceAcceptanceTest < Minitest::Test
  # Incorrect predictions must fail the examples they describe.
  def test_incorrect_predictions_are_rejected
    Dir.mktmpdir do |directory|
      exercise = Rkoans::Exercise.new(directory: directory, id: 'about-inheritance')
      exercise.prepare
      reference = File.read(exercise.reference)
      cases = [
        %w[subclasses_have_the_parent_as_an_ancestor_one false test_subclasses_have_the_parent_as_an_ancestor],
        %w[all_classes_ultimately_inherit_from_object_one false test_all_classes_ultimately_inherit_from_object]
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
