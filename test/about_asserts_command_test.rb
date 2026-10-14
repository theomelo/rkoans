# frozen_string_literal: true

require 'test_helper'
require_relative 'support/command_support'

class AboutAssertsCommandTest < Minitest::Test
  include CommandSupport

  # Starts a new learner at assertions, then checks a partial and complete answer.
  def test_default_start_introduces_assertions_and_checks_each_answer
    Dir.mktmpdir do |directory|
      with_watcher(directory:) do |stream|
        screen = wait_for(stream, 'Watching')

        assert_includes screen, 'about_asserts.rb'
        assert_includes screen, '5 runs'
        assert_includes screen, '5 failures'
      end
      path = File.join(directory, 'ruby-koans/exercises/about-asserts/about_asserts.rb')
      source = reference_source('about-asserts')
      File.write(path, source.sub('filled_value: 2', 'filled_value: nil'))
      output, status = run_command('check', directory: directory)

      assert_equal 1, status.exitstatus
      assert_includes output, 'test_fill_in_values'
      assert_includes output, '1 failures'
      File.write(path, source)
      output, status = run_command('check', directory: directory)

      assert_predicate status, :success?, output
      assert_includes output, '5 runs'
      assert_includes output, '0 failures, 0 errors'
    end
  end
end
