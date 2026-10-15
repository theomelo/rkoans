# frozen_string_literal: true

require 'test_helper'
require 'tmpdir'

class AboutProxyObjectProjectAcceptanceTest < Minitest::Test
  # A plausible partial implementation must fail a behavioral check, without errors.
  def test_incomplete_implementation_is_rejected
    Dir.mktmpdir do |directory|
      exercise = Rkoans::Exercise.new(directory: directory, id: 'about-proxy-object-project')
      exercise.prepare
      File.write(exercise.solution, File.read(exercise.reference) + <<~RUBY)
        module Exercises
          class AboutProxyObjectProject::Proxy
            def method_missing(name, *args, **keywords, &block)
              @messages << name
              @target.public_send(name, *args, **keywords)
            end
          end
        end
      RUBY
      result = Rkoans::Checker.new.run(exercise)

      assert_equal 1, result.exit_code, result.output
      assert_includes result.output, 'test_keywords_and_blocks_reach_the_target'
      assert_includes result.output, '0 errors'
    end
  end
end
