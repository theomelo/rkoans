# frozen_string_literal: true

require 'test_helper'
require 'tmpdir'

class TimeAndDateAcceptanceTest < Minitest::Test
  # Reject the incomplete fix while exercising the lesson's independent checks.
  def test_incorrect_fix_is_rejected
    Dir.mktmpdir do |directory|
      exercise = Rkoans::Exercise.new(directory: directory, id: 'time-and-date')
      exercise.prepare
      File.write(exercise.solution, File.read(exercise.reference) + <<~RUBY)
        module Exercises
          class TimeAndDate
            def self.utc(text) = Time.iso8601(text).iso8601
          end
        end
      RUBY
      result = Rkoans::Checker.new.run(exercise)

      assert_equal 1, result.exit_code, result.output
      assert_includes result.output, 'test_time_offset'
    end
  end

  # Reject a type or visibility mistake that ordinary value/access checks can miss.
  def test_rational_day_count_is_rejected
    Dir.mktmpdir do |directory|
      exercise = Rkoans::Exercise.new(directory: directory, id: 'time-and-date')
      exercise.prepare
      File.write(exercise.solution, File.read(exercise.reference) + <<~RUBY)
        module Exercises
          class TimeAndDate
            def self.days_between(first, last)
              Date.iso8601(last) - Date.iso8601(first)
            end
          end
        end
      RUBY
      result = Rkoans::Checker.new.run(exercise)

      assert_equal 1, result.exit_code, result.output
      assert_includes result.output, 'test_calendar_days'
      assert_includes result.output, '0 errors'
      assert_includes result.output, 'Rational'
    end
  end
end
