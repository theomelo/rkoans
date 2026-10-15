# frozen_string_literal: true

require 'test_helper'
require 'tmpdir'

class ClosureCaptureAcceptanceTest < Minitest::Test
  # Reject the incomplete fix while exercising the lesson's independent checks.
  def test_incorrect_fix_is_rejected
    Dir.mktmpdir do |directory|
      exercise = Rkoans::Exercise.new(directory: directory, id: 'closure-capture')
      exercise.prepare
      File.write(exercise.solution, File.read(exercise.reference) + <<~RUBY)
        module Exercises
          class ClosureCapture
            def self.multipliers(numbers)
              numbers.map { |factor| ->(value) { value * numbers.last } }
             end
          end
        end
      RUBY
      result = Rkoans::Checker.new.run(exercise)

      assert_equal 1, result.exit_code, result.output
      assert_includes result.output, 'test_separate_captures'
    end
  end
end
