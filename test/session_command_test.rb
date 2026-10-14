# frozen_string_literal: true

require 'test_helper'
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
        assert_includes screen, '1/3'
        assert_path_exists File.join(FIXTURE_ROOT, 'solutions/first-exercise/first_exercise.rb')
      end
      with_session(directory) do |_input, output|
        screen = wait_for(output, 'q:quit')

        assert_includes screen, 'Exercise done'
        assert_includes screen, solution(directory)
        assert_includes screen, '1/3'
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
        %w[second-exercise third-exercise].each_with_index do |id, index|
          screen = complete_next(input, output, directory, id)

          assert_includes screen, "#{index + 2}/3"
        end
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
        starter = File.join(FIXTURE_ROOT, 'exercises/first-exercise/first_exercise.rb')
        File.write(solution(directory), File.read(starter))
        input.puts 'n'
        wait_for(output, 'Finish the current exercise')
        wait_for(output, 'q:quit')
        selected = File.join(directory, 'ruby-koans/.rkoans/selection')

        assert_equal 'first-exercise', File.read(selected).strip
      end
    end
  end

  FIXTURE_ROOT = File.join(ROOT, 'test/fixtures/curriculum')
  FIXTURE_COMMAND = [RbConfig.ruby, '-I', File.join(ROOT, 'lib'),
                     File.join(ROOT, 'test/support/fixture_session.rb')].freeze

  private

  # Returns the fixed fixture's passing source, independent of the real curriculum.
  def reference_source(id = 'first-exercise')
    File.read(File.join(FIXTURE_ROOT, 'solutions', id, "#{id.tr('-', '_')}.rb"))
  end

  # Returns the first fixture exercise's learner path.
  def solution(directory)
    File.join(directory, 'ruby-koans/exercises/first-exercise/first_exercise.rb')
  end

  # Advances to +id+, supplies its reference, and returns the completed screen.
  # Assertions verify that the selected file is shown and its checks actually pass.
  def complete_next(input, output, directory, id)
    input.puts 'n'
    screen = wait_for(output, 'q:quit')
    path = File.join(directory, 'ruby-koans/exercises', id, "#{id.tr('-', '_')}.rb")

    assert_includes screen, path
    File.write(path, reference_source(id))
    screen = wait_for(output, 'q:quit')

    assert_includes screen, 'Exercise done'
    screen
  end

  # Runs an interactive command with an isolated home and verifies a clean quit.
  def with_session(directory)
    Open3.popen2e({ 'HOME' => directory }, *FIXTURE_COMMAND, chdir: directory, pgroup: true) do |input, output, child|
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
