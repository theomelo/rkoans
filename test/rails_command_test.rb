# frozen_string_literal: true

require 'test_helper'
require 'tmpdir'
require 'open3'
require 'timeout'
require_relative 'support/rails_support'
require_relative 'support/command_support'

class RailsCommandTest < Minitest::Test
  include RailsSupport
  include CommandSupport

  # Missing dependencies stop start/check with exit 2, without silently installing.
  def test_missing_runtime_exits_with_setup_guidance
    Dir.mktmpdir do |directory|
      output, status = Open3.capture2e(*fixture_command(directory, 'start', 'route-example'), stdin_data: "q\n")

      assert_equal 2, status.exitstatus, output
      assert_includes output, 'rkoans setup rails'
      refute_includes output, 'Watching for saves'
      output, status = Open3.capture2e(*fixture_command(directory, 'check'))

      assert_equal 2, status.exitstatus, output
      refute_path_exists File.join(directory, '.rkoans/runtimes/rails')
    end
  end

  # Editing either file reruns a fresh app, and restarting preserves the full repair.
  def test_watch_checks_both_files_and_preserves_edits
    prepared_runtime
    Dir.mktmpdir do |directory|
      link_runtime(directory)
      exercise = Rkoans::Exercise.new(directory: directory, catalog: Rkoans::Catalog.new(root: RAILS_FIXTURE))
      watch_repair(directory, exercise)
      contents = exercise.editable_files.to_h { |path| [path, File.read(path)] }
      _, status = Open3.capture2e(*fixture_command(directory), stdin_data: "q\n")

      assert_predicate status, :success?
      contents.each { |path, text| assert_equal text, File.read(path) }
      boot = File.join(exercise.workspace, 'config/application.rb')
      original = File.read(boot)
      File.write(boot, "class Broken <\n")
      output, status = Open3.capture2e(*fixture_command(directory, 'check'))

      assert_equal 1, status.exitstatus, output
      assert_includes output, 'SyntaxError'
      File.write(boot, original)
      _, status = Open3.capture2e(*fixture_command(directory, 'check'))

      assert_predicate status, :success?
    end
  end

  private

  # Watches the real CLI while applying controller-only and then complete repairs.
  def watch_repair(directory, exercise)
    Open3.popen2e(*fixture_command(directory, 'start', 'route-example'), pgroup: true) do |input, stream, child|
      initial = wait_for(stream, 'Watching for saves')

      exercise.editable_files.each { |path| assert_includes initial, path }
      controller = exercise.editable_files.last
      File.write(controller, File.read(exercise.reference_files.fetch(controller)))
      output = wait_for(stream, 'Watching for saves')

      assert_includes output, 'FAIL'
      File.write(exercise.solution, File.read(exercise.reference))
      output = wait_for(stream, 'Watching for saves')

      assert_includes output, 'Exercise done'
      input.write("q\n")
      input.flush

      assert_equal 0, Timeout.timeout(8) { child.value.exitstatus }
    ensure
      Process.kill('KILL', -child.pid) if child&.alive?
    end
  end

  # Reuses the explicitly installed dependency cache without downloading in tests.
  def link_runtime(directory)
    destination = File.join(directory, '.rkoans/runtimes/rails')
    FileUtils.mkdir_p(destination)
    File.symlink(File.join(RAILS_CACHE, 'bundle'), File.join(destination, 'bundle'))
  end

  # Runs the real CLI with a fixed fixture curriculum and an isolated study directory.
  def fixture_command(directory, *arguments)
    root = File.expand_path('../lib', __dir__)
    source = 'exit Rkoans::CLI.new(directory: ARGV.shift, catalog: Rkoans::Catalog.new(root: ARGV.shift)).run(ARGV)'
    [RbConfig.ruby, '-I', root, '-rrkoans', '-e', source, '--', directory, RAILS_FIXTURE, *arguments]
  end
end
