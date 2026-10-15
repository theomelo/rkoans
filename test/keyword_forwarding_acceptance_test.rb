# frozen_string_literal: true

require 'test_helper'
require 'tmpdir'

class KeywordForwardingAcceptanceTest < Minitest::Test
  # Reject the incomplete fix while exercising the lesson's independent checks.
  def test_incorrect_fix_is_rejected
    Dir.mktmpdir do |directory|
      exercise = Rkoans::Exercise.new(directory: directory, id: 'keyword-forwarding')
      exercise.prepare
      File.write(exercise.solution, File.read(exercise.reference) + <<~RUBY)
        module Exercises
          class KeywordForwarding
            def self.forward(*args, **keywords, &block)
              target(*args, &block)
             end
          end
        end
      RUBY
      result = Rkoans::Checker.new.run(exercise)

      assert_equal 1, result.exit_code, result.output
      assert_includes result.output, 'test_keyword_and_block'
    end
  end
end
