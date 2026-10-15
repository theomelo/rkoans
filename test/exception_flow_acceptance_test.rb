# frozen_string_literal: true

require 'test_helper'
require 'tmpdir'

class ExceptionFlowAcceptanceTest < Minitest::Test
  # Reject the incomplete fix while exercising the lesson's independent checks.
  def test_incorrect_fix_is_rejected
    Dir.mktmpdir do |directory|
      exercise = Rkoans::Exercise.new(directory: directory, id: 'exception-flow')
      exercise.prepare
      File.write(exercise.solution, File.read(exercise.reference) + <<~RUBY)
        module Exercises
          class ExceptionFlow
            def self.reraises
              raise ArgumentError, 'original'
             rescue ArgumentError
              nil
             end
          end
        end
      RUBY
      result = Rkoans::Checker.new.run(exercise)

      assert_equal 1, result.exit_code, result.output
      assert_includes result.output, 'test_reraise'
    end
  end
end
