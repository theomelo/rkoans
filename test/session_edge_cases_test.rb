# frozen_string_literal: true

require 'test_helper'
require_relative 'support/command_support'

class SessionEdgeCasesTest < Minitest::Test
  include CommandSupport

  def test_finishing_last_exercise_does_not_claim_skipped_exercises_are_complete
    Dir.mktmpdir do |directory|
      exercise = Rkoans::Exercise.new(directory: File.join(directory, 'ruby-koans'), id: 'blocks-and-methods')
      exercise.prepare
      File.write(exercise.solution, File.read(exercise.reference))
      output, status = Open3.capture2e({ 'HOME' => directory }, *COMMAND, 'start', 'blocks-and-methods',
                                       chdir: directory, stdin_data: "n\nq\n")

      assert_predicate status, :success?
      assert_includes output, '1/2'
      assert_includes output, 'No next exercise'
      refute_includes output, 'All exercises complete'
    end
  end
end
