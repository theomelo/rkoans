# frozen_string_literal: true

require 'test_helper'
require 'tmpdir'

class AboutScoringProjectAcceptanceTest < Minitest::Test
  # A plausible partial implementation must fail a behavioral check, without errors.
  def test_incomplete_implementation_is_rejected
    Dir.mktmpdir do |directory|
      exercise = Rkoans::Exercise.new(directory: directory, id: 'about-scoring-project')
      exercise.prepare
      File.write(exercise.solution, File.read(exercise.reference) + <<~RUBY)
        module Exercises
          class AboutScoringProject
            def self.score(dice)
              dice.tally.sum do |face, count|
                (count / 3) * (face == 1 ? 1000 : face * 100) + count * { 1 => 100, 5 => 50 }.fetch(face, 0)
              end
            end
          end
        end
      RUBY
      result = Rkoans::Checker.new.run(exercise)

      assert_equal 1, result.exit_code, result.output
      assert_includes result.output, 'test_score_of_a_triple_1_is_1000'
      assert_includes result.output, '0 errors'
    end
  end
end
