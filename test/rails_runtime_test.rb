# frozen_string_literal: true

require 'test_helper'
require 'tmpdir'
require 'stringio'

class RailsRuntimeTest < Minitest::Test
  # Missing dependencies are a setup problem, not a failed learner solution.
  def test_missing_runtime_returns_setup_error_without_installing
    Dir.mktmpdir do |directory|
      catalog = Rkoans::Catalog.new(root: File.expand_path('fixtures/rails_curriculum', __dir__))
      exercise = Rkoans::Exercise.new(directory: directory, catalog: catalog)
      exercise.prepare
      runtime = Rkoans::RailsRuntime.new(directory: File.join(directory, 'runtime'))
      result = Rkoans::Checker.new(rails_runtime: runtime).run(exercise)

      assert_equal 2, result.exit_code
      assert_includes result.output, 'rkoans setup rails'
      refute_path_exists File.join(directory, 'runtime')
    end
  end

  # Invalid setup invocations must not select or run a lesson.
  def test_setup_requires_the_rails_runtime_name
    out = StringIO.new
    err = StringIO.new
    cli = Rkoans::CLI.new(out: out, err: err)

    assert_equal 2, cli.run(%w[setup unknown])
    assert_equal 2, cli.run(['setup'])
    assert_equal 2, cli.run(%w[setup rails extra])
    assert_includes err.string, 'setup rails'
  end

  # Isolation removes the caller's bundle and Ruby injection options.
  def test_runtime_environment_is_independent_of_ambient_bundle_configuration
    Dir.mktmpdir do |directory|
      runtime = Rkoans::RailsRuntime.new(directory: directory)
      keys = %w[BUNDLE_GEMFILE BUNDLE_PATH BUNDLE_APP_CONFIG BUNDLE_WITH BUNDLER_SETUP RUBYOPT RUBYLIB]
      original = keys.to_h { |key| [key, ENV.fetch(key, nil)] }
      keys.each { |key| ENV[key] = '/outside/hostile' }
      environment = runtime.environment

      assert_equal File.join(directory, 'bundle'), environment['BUNDLE_PATH']
      assert_equal File.join(directory, 'config'), environment['BUNDLE_APP_CONFIG']
      assert_equal 'true', environment['BUNDLE_FROZEN']
      assert_equal 'test', environment['RAILS_ENV']
      assert_nil environment['RUBYOPT']
      assert_nil environment['RUBYLIB']
      assert_nil environment['BUNDLE_WITH']
      assert environment.key?('BUNDLER_SETUP')
      assert_nil environment['BUNDLER_SETUP']
      assert_match(%r{/runtime/rails/Gemfile\z}, environment['BUNDLE_GEMFILE'])
    ensure
      original&.each { |key, value| value ? ENV[key] = value : ENV.delete(key) }
    end
  end

  # Failed dependency setup leaves the independent Ruby runner usable.
  def test_failed_setup_does_not_break_ruby_checks
    Dir.mktmpdir do |directory|
      output = StringIO.new
      runtime = Rkoans::RailsRuntime.new(directory: File.join(directory, 'runtime'), root: directory)

      assert_equal 2, runtime.setup(out: output)
      refute_empty output.string
      catalog = Rkoans::Catalog.new(root: File.expand_path('fixtures/curriculum', __dir__))
      exercise = Rkoans::Exercise.new(directory: directory, catalog: catalog)
      exercise.prepare
      File.write(exercise.solution, File.read(exercise.reference))
      result = Rkoans::Checker.new(rails_runtime: runtime).run(exercise)

      assert_equal 0, result.exit_code, result.output
    end
  end

  # Runtime installation must not follow a symlink out of the selected study directory.
  def test_setup_rejects_symlinked_runtime_ancestors
    Dir.mktmpdir do |directory|
      outside = File.join(directory, 'outside')
      FileUtils.mkdir_p(outside)
      File.symlink(outside, File.join(directory, '.rkoans'))
      runtime = Rkoans::RailsRuntime.for_workspace(directory)

      assert_raises(Rkoans::Error) { runtime.setup(out: StringIO.new) }
      assert_empty Dir.children(outside)
    end
  end
end
