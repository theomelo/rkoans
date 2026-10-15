# frozen_string_literal: true

require 'test_helper'
require 'tmpdir'

class RegexpCapturesAcceptanceTest < Minitest::Test
  # Reject the incomplete fix while exercising the lesson's independent checks.
  def test_incorrect_fix_is_rejected
    Dir.mktmpdir do |directory|
      exercise = Rkoans::Exercise.new(directory: directory, id: 'regexp-captures')
      exercise.prepare
      File.write(exercise.solution, File.read(exercise.reference) + <<~'RUBY')
        module Exercises
          class RegexpCaptures
            def self.parse(text)
              match = /^(?<name>[a-z]+):(?<id>\d+)$/.match(text)
              match && {name:match[:name],id:match[:id].to_i}
             end
          end
        end
      RUBY
      result = Rkoans::Checker.new.run(exercise)

      assert_equal 1, result.exit_code, result.output
      assert_includes result.output, 'test_whole_string_and_captures'
    end
  end

  # Reject a type or visibility mistake that ordinary value/access checks can miss.
  def test_float_identifier_is_rejected
    Dir.mktmpdir do |directory|
      exercise = Rkoans::Exercise.new(directory: directory, id: 'regexp-captures')
      exercise.prepare
      File.write(exercise.solution, File.read(exercise.reference) + <<~'RUBY')
        module Exercises
          class RegexpCaptures
            def self.parse(text)
              match = /\A(?<name>[a-z]+):(?<id>\d+)\z/.match(text)
              match && { name: match[:name], id: match[:id].to_f }
            end
          end
        end
      RUBY
      result = Rkoans::Checker.new.run(exercise)

      assert_equal 1, result.exit_code, result.output
      assert_includes result.output, 'test_whole_string_and_captures'
      assert_includes result.output, '0 errors'
      assert_includes result.output, 'Float'
    end
  end
end
