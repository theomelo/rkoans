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
    def initialize(timeout: 30)
      @timeout = timeout
    end

    # @param [Rkoans::Exercise] exercise
    # @return [Rkoans::Checker::Result]
    def run(exercise)
      Tempfile.create('rkoans-check') do |output|
        pid = Process.spawn(
          RbConfig.ruby, '-rminitest/autorun', exercise.checks, exercise.solution,
          out: output, err: output, pgroup: true
        )
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
