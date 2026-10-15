# frozen_string_literal: true

require 'test_helper'
require 'tmpdir'

class DynamicMethodsAcceptanceTest < Minitest::Test
  # Reject the incomplete fix while exercising the lesson's independent checks.
  def test_incorrect_fix_is_rejected
    Dir.mktmpdir do |directory|
      exercise = Rkoans::Exercise.new(directory: directory, id: 'dynamic-methods')
      exercise.prepare
      File.write(exercise.solution, File.read(exercise.reference) + <<~RUBY)
        module Exercises
          class DynamicMethods
            def self.evaluate(factor) = factor * 3
          end
        end
      RUBY
      result = Rkoans::Checker.new.run(exercise)

      assert_equal 1, result.exit_code, result.output
      assert_includes result.output, 'test_eval_binding_and_reflection'
    end
  end
end
