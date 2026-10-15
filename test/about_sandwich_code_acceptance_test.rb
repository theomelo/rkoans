# frozen_string_literal: true

require 'test_helper'
require 'tmpdir'

class AboutSandwichCodeAcceptanceTest < Minitest::Test
  # A plausible partial implementation must fail a behavioral check, without errors.
  def test_incomplete_implementation_is_rejected
    Dir.mktmpdir do |directory|
      exercise = Rkoans::Exercise.new(directory: directory, id: 'about-sandwich-code')
      exercise.prepare
      File.write(exercise.solution, File.read(exercise.reference) + <<~RUBY)
        module Exercises
          class AboutSandwichCode
            def self.file_sandwich(path)
              file = File.open(path)
              result = yield file
              file.close
              result
            end
          end
        end
      RUBY
      result = Rkoans::Checker.new.run(exercise)

      assert_equal 1, result.exit_code, result.output
      assert_includes result.output, 'test_file_sandwich_closes_on_success_and_exception'
      assert_includes result.output, '0 errors'
    end
  end
end
