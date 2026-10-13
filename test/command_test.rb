# frozen_string_literal: true

require 'minitest/autorun'
require_relative 'support/command_support'

class CommandTest < Minitest::Test
  include CommandSupport

  def test_check_reports_failure_then_success_from_another_directory
    Dir.mktmpdir('rkoans learner ') do |directory|
      output, status = run_command('check', directory: directory)

      assert_equal 2, status.exitstatus
      assert_includes output, 'rkoans start'

      with_watcher(directory:) { |stream| wait_for(stream, 'Watching') }
      output, status = run_command('check', directory: directory)

      assert_equal 1, status.exitstatus
      assert_includes output, '2 runs'

      File.write(solution(directory), reference_source)
      output, status = run_command('check', directory: directory)

      assert_predicate status, :success?
      assert_includes output, '0 failures, 0 errors'
    end
  end

  def test_default_start_watches_atomic_saves_and_preserves_edits_on_restart
    Dir.mktmpdir do |directory|
      with_watcher(directory:) do |stream|
        wait_for(stream, 'Watching')
        replacement = File.join(directory, 'saved.rb')
        File.write(replacement, reference_source)
        File.rename(replacement, solution(directory))
        output = wait_for(stream, 'Watching')

        assert_includes output, 'Solution for comparison:'

        File.write(solution(directory), 'module Exercise; def self.exercises = ; end')

        assert_includes wait_for(stream, 'FAIL'), 'SyntaxError'
        File.write(solution(directory), reference_source)
        wait_for(stream, 'Exercise done')
      end
      with_watcher('start', directory:) { |stream| wait_for(stream, 'Exercise done') }

      assert_equal reference_source, File.read(solution(directory))
    end
  end
end
