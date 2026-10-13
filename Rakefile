# frozen_string_literal: true

require 'bundler/gem_tasks'
require 'minitest/test_task'

Minitest::TestTask.create do |task|
  task.test_globs = ['test/*_test.rb', 'test/test_*.rb']
end

desc 'Validate the RBS signatures'
task :signatures do
  ruby '-rrbs', '-rrbs/cli', '-e',
       'RBS::CLI.new(stdout: $stdout, stderr: $stderr).run(ARGV)', '--', '-I', 'sig', 'validate'
end

require 'rubocop/rake_task'

RuboCop::RakeTask.new

task default: %i[test signatures rubocop]
