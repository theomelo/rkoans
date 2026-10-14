# frozen_string_literal: true

require 'minitest/autorun'
require_relative 'support/command_support'

class SelectionCommandTest < Minitest::Test
  include CommandSupport

  def test_named_exercises_are_listed_and_selection_resumes_without_losing_edits
    Dir.mktmpdir do |directory|
      output, status = run_command('list', directory: directory)

      assert_predicate status, :success?
      assert_includes output, 'collection-basics'
      assert_includes output, 'blocks-and-methods'
      refute_path_exists File.join(directory, 'ruby-koans')

      with_watcher('start', 'collection-basics', directory:) { |stream| wait_for(stream, 'Watching') }
      File.write(solution(directory), reference_source)
      with_watcher('start', 'blocks-and-methods', directory:) { |stream| wait_for(stream, 'Watching') }
      path = File.join(directory, 'ruby-koans/exercises/blocks-and-methods/blocks_and_methods.rb')
      output, status = run_command('check', directory: directory)

      assert_equal 1, status.exitstatus
      assert_includes output, path
      assert_includes output, '2 runs'
      File.write(path, reference_source('blocks-and-methods'))
      with_watcher(directory:) { |stream| wait_for(stream, 'Exercise done') }
      output, status = run_command('check', directory: directory)

      assert_predicate status, :success?
      assert_includes output, '0 failures, 0 errors'
      with_watcher('start', 'collection-basics', directory:) { |stream| wait_for(stream, 'Exercise done') }

      assert_equal reference_source, File.read(solution(directory))
    end
  end

  def test_unknown_exercise_is_rejected_without_creating_a_workspace
    Dir.mktmpdir do |directory|
      output, status = run_command('start', '../unknown', directory: directory)

      assert_equal 2, status.exitstatus
      assert_includes output, 'Unknown exercise'
      refute_path_exists File.join(directory, 'ruby-koans')
    end
  end
end
