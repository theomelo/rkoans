# frozen_string_literal: true

require 'test_helper'
require_relative 'support/command_support'

class AboutTrueAndFalseCommandTest < Minitest::Test
  include CommandSupport

  # Selects truthiness, then checks a partial and complete prediction set.
  def test_truth_values_reject_partial_answers_and_accept_reference
    Dir.mktmpdir do |directory|
      with_watcher('start', 'about-true-and-false', directory:) do |stream|
        screen = wait_for(stream, 'Watching')

        assert_includes screen, 'about_true_and_false.rb'
        assert_includes screen, '4 runs'
        assert_includes screen, '4 failures'
      end
      path = File.join(directory, 'ruby-koans/exercises/about-true-and-false/about_true_and_false.rb')
      source = reference_source('about-true-and-false')
      File.write(path, source.sub('zero: :true_stuff', 'zero: :false_stuff'))
      output, status = run_command('check', directory: directory)

      assert_equal 1, status.exitstatus
      assert_includes output, 'test_everything_else_is_treated_as_true'
      assert_includes output, '1 failures'
      assert_includes output, 'Expected: :false_stuff'
      assert_includes output, 'Actual: :true_stuff'
      File.write(path, source)
      output, status = run_command('check', directory: directory)

      assert_predicate status, :success?, output
      assert_includes output, '4 runs'
      assert_includes output, '0 failures, 0 errors'
    end
  end
end
