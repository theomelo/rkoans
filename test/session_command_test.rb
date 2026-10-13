# frozen_string_literal: true

require 'minitest/autorun'
require_relative 'support/command_support'

class SessionCommandTest < Minitest::Test
  include CommandSupport

  def test_completion_is_persisted_and_restart_keeps_current_exercise
    Dir.mktmpdir do |directory|
      with_session(directory) do |input, output|
        wait_for(output, 'q:quit')
        input.puts 'n'
        wait_for(output, 'Finish the current exercise')
        wait_for(output, 'q:quit')
        File.write(solution(directory), reference_source)
        screen = wait_for(output, 'q:quit')

        assert_includes screen, 'Exercise done'
        assert_includes screen, 'Solution for comparison:'
        assert_includes screen, '1/2'
        assert_path_exists File.join(ROOT, 'solutions/collection-basics/collection_basics.rb')
      end
      with_session(directory) do |_input, output|
        screen = wait_for(output, 'q:quit')

        assert_includes screen, 'Exercise done'
        assert_includes screen, solution(directory)
        assert_includes screen, '1/2'
      end
    end
  end

  def test_next_advances_only_after_success_and_stops_at_the_last_exercise
    Dir.mktmpdir do |directory|
      with_session(directory) do |input, output|
        wait_for(output, 'q:quit')
        File.write(solution(directory), reference_source)
        wait_for(output, 'Exercise done')
        wait_for(output, 'q:quit')
        input.puts 'n'
        screen = wait_for(output, 'q:quit')
        path = File.join(directory, 'ruby-koans/exercises/blocks-and-methods/blocks_and_methods.rb')

        assert_includes screen, path
        File.write(path, reference_source('blocks-and-methods'))
        screen = wait_for(output, 'q:quit')

        assert_includes screen, '2/2'
        input.puts 'n'
        wait_for(output, 'All exercises complete')

        assert_equal reference_source, File.read(solution(directory))
      end
    end
  end

  def test_next_rechecks_edits_to_a_completed_exercise
    Dir.mktmpdir do |directory|
      with_session(directory) do |input, output|
        wait_for(output, 'q:quit')
        File.write(solution(directory), reference_source)
        wait_for(output, 'q:quit')
        starter = File.join(ROOT, 'exercises/collection-basics/collection_basics.rb')
        File.write(solution(directory), File.read(starter))
        input.puts 'n'
        wait_for(output, 'Finish the current exercise')
        wait_for(output, 'q:quit')
        selected = File.join(directory, 'ruby-koans/.rkoans/selection')

        assert_equal 'collection-basics', File.read(selected).strip
      end
    end
  end

  private

  def with_session(directory)
    Open3.popen2e({ 'HOME' => directory }, *COMMAND, chdir: directory, pgroup: true) do |input, output, child|
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
