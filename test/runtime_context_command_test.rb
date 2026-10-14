# frozen_string_literal: true

require 'test_helper'
require_relative 'support/command_support'

class RuntimeContextCommandTest < Minitest::Test
  include CommandSupport

  # Exercises selection, starter failure, and reference success through the CLI.
  def test_runtime_context_can_be_selected_and_completed
    Dir.mktmpdir do |directory|
      output, status = run_command('list', directory: directory)

      assert_predicate status, :success?
      assert_includes output, 'runtime-context'
      with_watcher('start', 'runtime-context', directory:) { |stream| wait_for(stream, 'Watching') }
      output, status = run_command('check', directory: directory)

      assert_equal 1, status.exitstatus
      assert_includes output, '3 runs'
      path = File.join(directory, 'ruby-koans/exercises/runtime-context/runtime_context.rb')
      File.write(path, reference_source('runtime-context'))
      output, status = run_command('check', directory: directory)

      assert_predicate status, :success?, output
      assert_includes output, '0 failures, 0 errors'
    end
  end
end
