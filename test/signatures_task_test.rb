# frozen_string_literal: true

require 'test_helper'
require 'tmpdir'
require 'open3'

class SignaturesTaskTest < Minitest::Test
  # A reported RBS error must fail rake, not merely print a diagnostic and succeed.
  def test_signature_validation_failure_fails_the_task
    root = File.expand_path('..', __dir__)
    Dir.mktmpdir do |directory|
      FileUtils.mkdir_p(File.join(directory, 'sig'))
      File.write(File.join(directory, 'fixture.gemspec'), <<~RUBY)
        Gem::Specification.new do |spec|
          spec.name = 'signature-fixture'
          spec.version = '0.0.0'
        end
      RUBY
      File.write(File.join(directory, 'sig/fixture.rbs'), <<~RBS)
        class FixtureSignature
          def value: -> String
          def value: -> Integer
        end
      RBS
      output, status = Open3.capture2e(RbConfig.ruby, Gem.bin_path('rake', 'rake'),
                                       '-f', File.join(root, 'Rakefile'), 'signatures', chdir: directory)

      refute_predicate status, :success?, output
      assert_includes output, 'DuplicatedMethodDefinitionError'
    end
  end
end
