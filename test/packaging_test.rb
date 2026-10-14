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
      %w[lib sig exercises solutions test exe].each { |path| FileUtils.cp_r(File.join(root, path), directory) }
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
    end
  end
end
