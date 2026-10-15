# frozen_string_literal: true

require 'test_helper'
require 'tmpdir'

class SingletonPatternAcceptanceTest < Minitest::Test
  # Reject the incomplete fix while exercising the lesson's independent checks.
  def test_incorrect_fix_is_rejected
    Dir.mktmpdir do |directory|
      exercise = Rkoans::Exercise.new(directory: directory, id: 'singleton-pattern')
      exercise.prepare
      File.write(exercise.solution, File.read(exercise.reference) + <<~RUBY)
        module Exercises
          class SingletonPattern
            class Configuration
              def self.instance = __send__(:new)
            end
          end
        end
      RUBY
      result = Rkoans::Checker.new.run(exercise)

      assert_equal 1, result.exit_code, result.output
      assert_includes result.output, 'test_singleton_identity'
    end
  end
end
