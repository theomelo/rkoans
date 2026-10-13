# frozen_string_literal: true

require 'English'
require 'open3'
require 'tmpdir'
require 'timeout'
require 'rbconfig'

module CommandSupport
  ROOT = File.expand_path('../..', __dir__)
  COMMAND = [RbConfig.ruby, '-I', File.join(ROOT, 'lib'), File.join(ROOT, 'exe/rkoans')].freeze

  private

  # Returns packaged reference source for +id+ to arrange a passing learner file.
  # Exercise checks keep their own expected values independent of this source.
  def reference_source(id = 'collection-basics')
    File.read(File.join(ROOT, 'solutions', id, "#{id.tr('-', '_')}.rb"))
  end

  # Returns the first exercise's editable path under the temporary home +directory+.
  def solution(directory)
    File.join(directory, 'ruby-koans/exercises/collection-basics/collection_basics.rb')
  end

  # Runs a command from another working directory using +directory+ as its home.
  # Returns the combined terminal output and process status.
  def run_command(*command_name, directory:)
    Open3.capture2e({ 'HOME' => directory }, *COMMAND, *command_name, chdir: File.dirname(directory))
  end

  # Yields a live watcher's output stream with keyboard input closed.
  # Interrupts the child on exit and verifies its cancellation status.
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

  # Reads through the next output line containing +text+ and returns the captured text.
  # Fails the test if the child exits or does not respond within eight seconds.
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
