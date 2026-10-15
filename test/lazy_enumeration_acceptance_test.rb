# frozen_string_literal: true

require 'test_helper'
require 'tmpdir'

class LazyEnumerationAcceptanceTest < Minitest::Test
  # Reject the incomplete fix while exercising the lesson's independent checks.
  def test_incorrect_fix_is_rejected
    Dir.mktmpdir do |directory|
      exercise = Rkoans::Exercise.new(directory: directory, id: 'lazy-enumeration')
      exercise.prepare
      File.write(exercise.solution, File.read(exercise.reference) + <<~RUBY)
        module Exercises
          class LazyEnumeration
            def self.first_multiples(limit) = (1..).lazy.select { |n| n % 7 == 0 }.first(3)
          end
        end
      RUBY
      result = Rkoans::Checker.new.run(exercise)

      assert_equal 1, result.exit_code, result.output
      assert_includes result.output, 'test_lazy_limit'
    end
  end
end
