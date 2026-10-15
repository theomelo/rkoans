# frozen_string_literal: true

require 'test_helper'
require 'tmpdir'

class PatternMatchingAcceptanceTest < Minitest::Test
  # Reject the incomplete fix while exercising the lesson's independent checks.
  def test_incorrect_fix_is_rejected
    Dir.mktmpdir do |directory|
      exercise = Rkoans::Exercise.new(directory: directory, id: 'pattern-matching')
      exercise.prepare
      File.write(exercise.solution, File.read(exercise.reference) + <<~RUBY)
        module Exercises
          class PatternMatching
            def self.amount(payload, kind)
              case payload
              in {type: _, amount: Integer => number} if number > 0
               number
              else
               nil
              end
             end
          end
        end
      RUBY
      result = Rkoans::Checker.new.run(exercise)

      assert_equal 1, result.exit_code, result.output
      assert_includes result.output, 'test_pinned_kind'
    end
  end
end
