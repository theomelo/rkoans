# frozen_string_literal: true

require 'test_helper'
require 'tmpdir'

class AboutDiceProjectAcceptanceTest < Minitest::Test
  # A plausible partial implementation must fail a behavioral check, without errors.
  def test_incomplete_implementation_is_rejected
    Dir.mktmpdir do |directory|
      exercise = Rkoans::Exercise.new(directory: directory, id: 'about-dice-project')
      exercise.prepare
      File.write(exercise.solution, File.read(exercise.reference) + <<~RUBY)
        module Exercises
          class AboutDiceProject::DiceSet
            def roll(count)
              value = @random.rand(1..6)
              @values = Array.new(count, value)
            end
          end
        end
      RUBY
      result = Rkoans::Checker.new.run(exercise)

      assert_equal 1, result.exit_code, result.output
      assert_includes result.output, 'test_rolls_use_the_random_source_and_values_stay_stable'
      assert_includes result.output, '0 errors'
    end
  end
end
