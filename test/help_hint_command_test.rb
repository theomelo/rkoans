# frozen_string_literal: true

require 'test_helper'
require_relative 'support/fixture_support'

class HelpHintCommandTest < Minitest::Test
  include FixtureSupport

  def test_help_is_always_available_and_hints_are_limited_to_unfinished_current_exercises
    Dir.mktmpdir do |directory|
      with_session(directory) do |input, output|
        screen = wait_for(output, '?:help')

        assert_includes screen, 'h:hint'
        input.write('h')
        screen = wait_for(output, '?:help')

        assert_includes screen, 'Replace false with true'
        input.write('?')
        screen = wait_for(output, '?:help')

        assert_includes screen, 'Keyboard help'
        input.write('l')
        screen = wait_for(output, '?:help')

        refute_includes screen, 'h:hint'
        assert_includes screen, 's:show current'
        input.write('?')
        screen = wait_for(output, '?:help')

        assert_includes screen, 'Keyboard help'
        input.write('s')
        wait_for(output, '?:help')
        File.write(solution(directory), reference_source)
        screen = wait_for(output, '?:help')

        assert_includes screen, 'Exercise done'
        refute_includes screen, 'h:hint'
      end
    end
  end

  private

  def with_session(directory)
    Open3.popen2e({ 'HOME' => directory }, *command, chdir: directory, pgroup: true) do |input, output, child|
      yield input, output
      input.puts 'q'
      Timeout.timeout(5) { child.join }

      assert_equal 0, child.value.exitstatus
    ensure
      Process.kill('INT', child.pid) if child.alive?
      child.join
    end
  end
end
