# frozen_string_literal: true

require 'test_helper'
require 'tmpdir'

class CheckerTest < Minitest::Test
  class TimeoutExercise < Rkoans::Exercise
    attr_reader :checks

    def initialize(directory:, checks:)
      super(directory: directory)
      @checks = checks
    end
  end

  def test_timeout_stops_the_check_and_its_child_process
    Dir.mktmpdir do |directory|
      pidfile = File.join(directory, 'child.pid')
      checks = File.join(directory, 'collection_basics_test.rb')
      File.write(checks, <<~RUBY)
        child = fork { sleep 60 }
        trap('TERM') { Process.wait(child); exit! }
        File.write(#{pidfile.inspect}, child.to_s)
        sleep 60
      RUBY
      exercise = TimeoutExercise.new(directory: directory, checks: checks)
      result = Rkoans::Checker.new(timeout: 0.5).run(exercise)

      assert_equal 1, result.exit_code
      assert_includes result.output, 'timed out'
      pid = Integer(File.read(pidfile))
      state = IO.popen(['ps', '-o', 'stat=', '-p', pid.to_s], &:read).strip

      assert_match(/\A(?:Z.*)?\z/, state, 'Timed-out descendant must not keep running')
    ensure
      begin
        Process.kill('KILL', pid) if pid
      rescue Errno::ESRCH
        # The checker already terminated it.
      end
    end
  end
end
