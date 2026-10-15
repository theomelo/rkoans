# frozen_string_literal: true

require 'test_helper'
require 'tmpdir'

class LiteralsAndOperatorsAcceptanceTest < Minitest::Test
  # Reject the incomplete fix while exercising the lesson's independent checks.
  def test_incorrect_fix_is_rejected
    Dir.mktmpdir do |directory|
      exercise = Rkoans::Exercise.new(directory: directory, id: 'literals-and-operators')
      exercise.prepare
      File.write(exercise.solution, File.read(exercise.reference) + <<~RUBY)
        module Exercises
          class LiteralsAndOperators
            def self.default_for_nil(value) = value || 'missing'
          end
        end
      RUBY
      result = Rkoans::Checker.new.run(exercise)

      assert_equal 1, result.exit_code, result.output
      assert_includes result.output, 'test_short_circuit_default'
    end
  end
end
