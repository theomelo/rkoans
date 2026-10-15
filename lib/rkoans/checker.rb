# frozen_string_literal: true

require 'rbconfig'
require 'tempfile'
require 'timeout'

module Rkoans
  # Runs ordinary Minitest checks in a child process with a time limit.
  class Checker
    MAX_KB = 65_536
    Result = Data.define(:output, :exit_code)

    # @param [Integer | Float] timeout
    def initialize(timeout: 30, rails_runtime: RailsRuntime.new)
      @timeout = timeout
      @rails_runtime = rails_runtime
    end

    # @param [Rkoans::Exercise] exercise
    # @return [Rkoans::Checker::Result]
    def run(exercise)
      return Result.new("Rails dependencies are missing. Run rkoans setup rails.\n", 2) if missing_runtime?(exercise)

      Tempfile.create('rkoans-check') do |output|
        pid = spawn_check(exercise, output)
        begin
          status = Timeout.timeout(@timeout) { Process.wait2(pid).last }
          output.rewind
          Result.new(output.read(MAX_KB), status.exitstatus || 1)
        rescue Timeout::Error
          Result.new("Checks timed out after #{@timeout} seconds.\n", 1)
        ensure
          stop_group(pid:)
          begin
            Process.wait(pid)
          rescue Errno::ECHILD
            # The child has already been reaped.
          end
        end
      end
    end

    private

    # @return [Boolean] whether a Rails exercise needs explicit dependency setup
    def missing_runtime?(exercise)
      exercise.runtime == 'rails' && !@rails_runtime.ready?
    end

    # Uses the same timeout/cancellation lifecycle for Ruby and isolated Rails children.
    # @return [Integer] child process ID
    def spawn_check(exercise, output)
      options = { in: File::NULL, out: output, err: output, pgroup: true }
      if exercise.runtime == 'rails'
        Process.spawn(@rails_runtime.environment, *@rails_runtime.command(exercise),
                      **options, chdir: exercise.workspace)
      else
        Process.spawn(RbConfig.ruby, '-rminitest/autorun', exercise.checks, exercise.solution, **options)
      end
    end

    # @param [Integer] pid
    # @return [Integer, nil]
    def stop_group(pid:)
      Process.kill('TERM', -pid)
      sleep 0.05
      reap_exited_child(pid)
      Process.kill('KILL', -pid)
    rescue Errno::ESRCH
      nil
    end

    def reap_exited_child(pid)
      Process.waitpid(pid, Process::WNOHANG)
    rescue Errno::ECHILD
      nil
    end
  end
end
