# frozen_string_literal: true

require 'fileutils'
require 'open3'
require 'rbconfig'

module Rkoans
  # Installs and runs an optional locked Rails bundle without loading Rails into the CLI.
  class RailsRuntime
    # Creates a runtime whose writable cache stays inside the selected study directory.
    # @return [RailsRuntime]
    def self.for_workspace(directory)
      new(directory: File.join(directory, '.rkoans/runtimes/rails'), boundary: directory)
    end

    # @param directory [String] user-owned runtime cache
    # @param root [String] installed gem root containing the runtime manifest
    def initialize(directory: nil, root: File.expand_path('../..', __dir__), boundary: nil)
      study = File.join(Dir.home, 'ruby-koans')
      @directory = File.expand_path(directory || File.join(study, '.rkoans/runtimes/rails'))
      @boundary = File.expand_path(boundary || directory || study)
      @manifest = File.join(File.expand_path(root), 'runtime/rails/Gemfile')
    end

    # Installs explicitly, returning a CLI exit code and streaming Bundler's diagnostics.
    # @return [Integer]
    def setup(out: $stdout)
      validate_setup_paths
      FileUtils.mkdir_p(@directory)
      Open3.popen2e(environment, *bundler_command('install'), chdir: @directory) do |input, stream, child|
        input.close
        stream.each_line { |line| out.write(line) }
        child.value.success? ? 0 : 2
      end
    end

    # Checks already-installed dependencies without creating a cache or accessing the network.
    # @return [Boolean]
    def ready?
      return false unless File.directory?(File.join(@directory, 'bundle'))

      _, status = Open3.capture2e(environment, *bundler_command('check'), chdir: @directory)
      status.success?
    end

    # @return [Array<String>] fresh child command, including the explicit application workspace
    def command(exercise)
      [RbConfig.ruby, '-rbundler/setup', '-rminitest/autorun', exercise.checks, exercise.workspace]
    end

    # Clears caller injection options and directs Bundler writes into the user runtime cache.
    # @return [Hash] environment overrides; nil values remove inherited variables
    def environment
      inherited = ENV.keys.grep(/\ABUNDLE_|\ABUNDLER_|\ARUBYOPT\z|\ARUBYLIB\z|\AGEM_HOME\z|\AGEM_PATH\z/)
      inherited.to_h { |name| [name, nil] }.merge(
        'BUNDLE_GEMFILE' => @manifest, 'BUNDLE_PATH' => File.join(@directory, 'bundle'),
        'BUNDLE_APP_CONFIG' => File.join(@directory, 'config'),
        'BUNDLE_USER_HOME' => File.join(@directory, 'user'), 'BUNDLE_IGNORE_CONFIG' => 'true',
        'BUNDLE_DISABLE_SHARED_GEMS' => 'true', 'BUNDLE_FROZEN' => 'true',
        'RUBYOPT' => nil, 'RUBYLIB' => nil, 'RAILS_ENV' => 'test'
      )
    end

    private

    # Rejects pre-existing symlinks anywhere in the owned cache or its write locations.
    def validate_setup_paths
      setup_paths.each do |path|
        raise Error, "Runtime paths cannot be symlinks: #{path}" if File.symlink?(path)
      end
    end

    # @return [Array<String>] owned ancestors and runtime locations that Bundler may write
    def setup_paths
      unless @directory == @boundary || @directory.start_with?("#{@boundary}/")
        raise Error, 'Runtime cache must remain inside its owned directory.'
      end

      parts = @directory.delete_prefix(@boundary).split('/').reject(&:empty?)
      paths = parts.each_with_object([@boundary]) { |part, list| list << File.join(list.last, part) }
      paths + %w[bundle config user].map { |name| File.join(@directory, name) }
    end

    # Runs this Ruby's Bundler instead of an unrelated bundle executable on PATH.
    # @return [Array<String>]
    def bundler_command(operation)
      [RbConfig.ruby, '-rbundler', '-e', 'load Gem.bin_path("bundler", "bundle", Bundler::VERSION)', '--', operation]
    end
  end
end
