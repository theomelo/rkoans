# frozen_string_literal: true

require 'test_helper'
require 'tmpdir'
require 'rubygems'
require 'open3'
require 'json'

class PackagingTest < Minitest::Test
  def test_package_includes_signatures_and_checks_but_not_learner_edits
    root = File.expand_path('..', __dir__)
    Dir.mktmpdir do |directory|
      %w[lib sig exercises solutions test exe runtime].each { |path| FileUtils.cp_r(File.join(root, path), directory) }
      specification = File.join(directory, 'rkoans.gemspec')
      FileUtils.cp(File.join(root, 'rkoans.gemspec'), specification)
      File.write(File.join(directory, 'exercises/collection-basics/notes.rb'), '# personal notes')
      script = 'require "json"; puts JSON.generate(Gem::Specification.load(ARGV.fetch(0)).files)'
      output, errors, status = Open3.capture3(RbConfig.ruby, '-e', script, specification)

      assert_predicate status, :success?, errors
      files = JSON.parse(output)

      assert_includes files, 'exercises/catalog.json'
      assert_includes files, 'sig/rkoans/checker.rbs'
      assert_includes files, 'test/exercises/collection_basics_test.rb'
      assert_includes files, 'exercises/collection-basics/collection_basics.rb'
      assert_includes files, 'exercises/collection-basics/brief.md'
      assert_includes files, 'exercises/collection-basics/hint.md'
      assert_includes files, 'solutions/collection-basics/collection_basics.rb'
      refute_includes files, 'exercises/collection-basics/notes.rb'
      refute_includes files, 'test/command_test.rb'
      refute_includes files, 'sig/rubocop/curriculum.rbs'
    end
  end

  # Application packages include the declared scaffold and exclude incidental Ruby files.
  def test_application_package_only_includes_declared_files
    root = File.expand_path('..', __dir__)
    fixture = File.join(__dir__, 'fixtures/rails_curriculum')
    Dir.mktmpdir do |directory|
      %w[lib sig exercises solutions test exe runtime].each { |path| FileUtils.cp_r(File.join(root, path), directory) }
      %w[exercises solutions].each do |folder|
        FileUtils.cp_r(File.join(fixture, folder, 'route-example'), File.join(directory, folder))
      end
      FileUtils.cp(File.join(root, 'rkoans.gemspec'), directory)
      File.write(File.join(directory, 'exercises/route-example/template/notes.rb'), '# personal notes')
      script = 'require "json"; puts JSON.generate(Gem::Specification.load(ARGV.fetch(0)).files)'
      output, errors, status = Open3.capture3(RbConfig.ruby, '-e', script, File.join(directory, 'rkoans.gemspec'))

      assert_predicate status, :success?, errors
      files = JSON.parse(output)
      template = files.grep(%r{\Aexercises/route-example/template/}).map do |file|
        file.delete_prefix('exercises/route-example/template/')
      end

      assert_equal %w[app/controllers/welcome_controller.rb config/application.rb
                      config/environment.rb config/routes.rb], template.sort
      assert_includes files, 'exercises/route-example/exercise.json'
      assert_equal %w[runtime/rails/Gemfile runtime/rails/Gemfile.lock], files.grep(%r{\Aruntime/})
    end
  end
end
