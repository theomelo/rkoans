# frozen_string_literal: true

require 'test_helper'
require 'tmpdir'

class AboutMessagePassingAcceptanceTest < Minitest::Test
  # Incorrect predictions must fail the examples they describe.
  def test_incorrect_predictions_are_rejected
    Dir.mktmpdir do |directory|
      exercise = Rkoans::Exercise.new(directory: directory, id: 'about-message-passing')
      exercise.prepare
      reference = File.read(exercise.reference)
      cases = [
        %w[methods_can_be_invoked_more_dynamically_one false test_methods_can_be_invoked_more_dynamically],
        %w[send_with_underscores_will_also_send_messages_one false test_send_with_underscores_will_also_send_messages]
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
