# frozen_string_literal: true

require 'test_helper'
require 'pty'
require_relative 'support/fixture_support'

class KeyboardSessionTest < Minitest::Test
  include FixtureSupport

  def test_list_and_show_are_immediate_but_next_and_quit_require_enter
    Dir.mktmpdir do |directory|
      catalog = Rkoans::Catalog.new(root: FIXTURE_ROOT)
      exercise = Rkoans::Exercise.new(directory: File.join(directory, 'ruby-koans'), catalog: catalog)
      exercise.prepare
      File.write(exercise.solution, reference_source)
      PTY.spawn({ 'HOME' => directory, 'NO_COLOR' => '1' }, *command) do |output, input, pid|
        wait_for(output, 'q:quit')
        input.write('l')
        screen = wait_for(output, 'q:quit')

        assert_includes screen, 's:show current'
        assert_includes screen, 'n:next'
        refute_includes screen, 'l:list'
        File.write(exercise.solution, "#{reference_source}\n# saved while listing\n")
        screen = wait_for(output, 'q:quit')

        assert_includes screen, 's:show current'
        input.write('s')
        screen = wait_for(output, 'q:quit')

        assert_includes screen, 'Exercise done'
        confirm_next_and_quit(input, output, pid, directory)
      ensure
        stop_child(pid)
      end
    end
  end

  private

  def confirm_next_and_quit(input, output, pid, directory)
    input.write('n')
    sleep 0.2
    selected = File.join(directory, 'ruby-koans/.rkoans/selection')

    assert_equal 'first-exercise', File.read(selected).strip
    input.write("\n")
    screen = wait_for(output, 'q:quit')

    assert_includes screen, 'second_exercise.rb'
    input.write('q')
    sleep 0.2

    assert_nil Process.waitpid(pid, Process::WNOHANG)
    input.write("\n")
    _, status = Timeout.timeout(5) { Process.wait2(pid) }

    assert_predicate status, :success?
  end

  def stop_child(pid)
    Process.kill('INT', pid)
    Process.wait(pid)
  rescue Errno::ESRCH, Errno::ECHILD
    nil
  end
end
