# frozen_string_literal: true

require 'test_helper'
require 'tmpdir'

class VisibilityAcceptanceTest < Minitest::Test
  # Reject the incomplete fix while exercising the lesson's independent checks.
  def test_incorrect_fix_is_rejected
    Dir.mktmpdir do |directory|
      exercise = Rkoans::Exercise.new(directory: directory, id: 'visibility')
      exercise.prepare
      File.write(exercise.solution, File.read(exercise.reference) + <<~RUBY)
        module Exercises
          class Visibility
            class Wallet
              public :balance
            end
          end
        end
      RUBY
      result = Rkoans::Checker.new.run(exercise)

      assert_equal 1, result.exit_code, result.output
      assert_includes result.output, 'test_protected_peer_calls'
    end
  end

  # Reject a type or visibility mistake that ordinary value/access checks can miss.
  def test_protected_normalizer_is_rejected
    Dir.mktmpdir do |directory|
      exercise = Rkoans::Exercise.new(directory: directory, id: 'visibility')
      exercise.prepare
      File.write(exercise.solution, File.read(exercise.reference) + <<~RUBY)
        module Exercises
          class Visibility
            class Wallet
              protected :normalize
            end
          end
        end
      RUBY
      result = Rkoans::Checker.new.run(exercise)

      assert_equal 1, result.exit_code, result.output
      assert_includes result.output, 'test_private_normalization'
      assert_includes result.output, '0 errors'
      assert_includes result.output, ':normalize'
    end
  end
end
