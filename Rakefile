# frozen_string_literal: true

require 'bundler/gem_tasks'
require 'minitest/test_task'

Minitest::TestTask.create do |task|
  task.test_globs = ['test/*_test.rb', 'test/test_*.rb']
end

desc 'Validate the RBS signatures'
task :signatures do
  ruby '-rrbs', '-rrbs/cli', '-e',
       'exit RBS::CLI.new(stdout: $stdout, stderr: $stderr).run(ARGV)', '--', '-I', 'sig', 'validate'
end

require 'rubocop/rake_task'

RuboCop::RakeTask.new

task default: %i[test signatures rubocop]

namespace :setup do
  desc 'Install the isolated Rails runtime used by integration tests'
  task :rails do
    require_relative 'lib/rkoans'
    runtime = Rkoans::RailsRuntime.new(directory: File.expand_path('tmp/rails-runtime', __dir__))
    abort 'Rails test runtime setup failed.' unless runtime.setup.zero?
  end
end
