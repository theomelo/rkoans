# frozen_string_literal: true

require 'English'
require 'minitest/autorun'
require 'open3'
require 'tmpdir'
require 'timeout'
require 'rbconfig'

class CommandTest < Minitest::Test
  ROOT = File.expand_path('..', __dir__)
  COMMAND = [RbConfig.ruby, '-I', File.join(ROOT, 'lib'), File.join(ROOT, 'exe/rkoans')].freeze
  FIXED = <<~RUBY
    module Exercises
      class Starter
        def self.koans
          { mapped: [2, 4, 6], selected: [1, 3] }
        end

        def self.double_odds(numbers)
          numbers.select(&:odd?).map { |number| number * 2 }
        end
      end
    end
  RUBY

  def test_check_reports_failure_then_success_from_another_directory
    Dir.mktmpdir('rkoans learner ') do |directory|
      output, status = run_command('check', directory: directory)

      assert_equal 2, status.exitstatus
      assert_includes output, 'rkoans start'

      with_watcher(directory:) { |stream| wait_for(stream, 'Watching') }
      output, status = run_command('check', directory: directory)

      assert_equal 1, status.exitstatus
      assert_includes output, '2 runs'

      File.write(solution(directory), FIXED)
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
        File.write(replacement, FIXED)
        File.rename(replacement, solution(directory))
        output = wait_for(stream, 'PASS')

        assert_includes output, '0 failures, 0 errors'

        File.write(solution(directory), 'module Exercise; def self.exercises = ; end')

        assert_includes wait_for(stream, 'FAIL'), 'SyntaxError'
        File.write(solution(directory), FIXED)
        wait_for(stream, 'PASS')
      end
      with_watcher('start', directory:) { |stream| wait_for(stream, 'PASS') }

      assert_equal FIXED, File.read(solution(directory))
    end
  end

  private

  # @param [String] directory
  # @return [String]
  def solution(directory)
    File.join(directory, 'ruby-koans/exercises/collection-basics/solution.rb')
  end

  # @param [Array<String>] command_name
  # @param [String] directory
  # @return [[String, Process::Status]]
  def run_command(*command_name, directory:)
    Open3.capture2e({ 'HOME' => directory }, *COMMAND, *command_name, chdir: File.dirname(directory))
  end

  # @param [Array<String>] message
  # @param [String] directory
  # @return Stream
  def with_watcher(*message, directory:)
    Open3.popen2e({ 'HOME' => directory }, *COMMAND, *message, chdir: directory, pgroup: true) do |input, stream, child|
      input.close
      begin
        yield stream
      ensure
        begin
          Process.kill('INT', child.pid) if child.alive?
        rescue Errno::ESRCH
          # The command may already have exited with an error.
        end
        begin
          Timeout.timeout(5) { child.join }
        rescue Timeout::Error
          Process.kill('KILL', -child.pid)
          child.join

          flunk 'Watcher did not stop on Ctrl-C'
        end
        assert_equal 130, child.value.exitstatus unless $ERROR_INFO
      end
    end
  end

  # @param [Stream] stream
  # @param [String] text
  # @return [String, TrueClass]
  def wait_for(stream, text)
    output = +''
    Timeout.timeout(8) do
      output << stream.readline until output.include?(text)
    end
    output
  rescue EOFError, Timeout::Error
    flunk "Expected #{text.inspect} in command output:\n#{output}"
  end
end
