# frozen_string_literal: true

require 'test_helper'
require 'tmpdir'
require 'open3'
require 'json'
require 'rubocop'

class CurriculumCopTest < Minitest::Test
  def test_complete_curriculum_and_missing_asset_diagnostics
    Dir.mktmpdir do |directory|
      root = File.expand_path('..', __dir__)
      FileUtils.cp_r(File.join(root, 'test/fixtures/curriculum/.'), directory)
      FileUtils.mkdir_p(File.join(directory, 'tools/rubocop'))
      FileUtils.cp(File.join(root, 'tools/rubocop/curriculum.rb'), File.join(directory, 'tools/rubocop'))
      File.write(File.join(directory, 'rkoans.gemspec'), "Gem::Specification.new\n")
      File.write(File.join(directory, '.rubocop.yml'), <<~YAML)
        require:
          - ./tools/rubocop/curriculum.rb
        Rkoans/Curriculum:
          Enabled: true
          Include:
            - rkoans.gemspec
      YAML

      assert_empty offenses(directory)

      %w[exercises/first-exercise/first_exercise.rb exercises/first-exercise/brief.md
         exercises/first-exercise/hint.md test/exercises/first_exercise_test.rb
         sig/exercises/first_exercise.rbs solutions/first-exercise/first_exercise.rb].each do |asset|
        path = File.join(directory, asset)
        source = File.read(path)
        File.delete(path)

        assert_equal ["Missing curriculum asset: #{asset}"], offenses(directory)
        File.write(path, source)
      end
      FileUtils.mkdir_p(File.join(directory, 'exercises/unregistered'))

      assert_equal ['Exercise directory is not registered: unregistered'], offenses(directory)
    end
  end

  def test_invalid_catalog_is_reported_as_an_offense
    Dir.mktmpdir do |directory|
      root = File.expand_path('..', __dir__)
      FileUtils.mkdir_p(File.join(directory, 'tools/rubocop'))
      FileUtils.cp(File.join(root, 'tools/rubocop/curriculum.rb'), File.join(directory, 'tools/rubocop'))
      FileUtils.mkdir_p(File.join(directory, 'exercises'))
      File.write(File.join(directory, 'rkoans.gemspec'), "Gem::Specification.new\n")
      File.write(File.join(directory, '.rubocop.yml'), "require:\n  - ./tools/rubocop/curriculum.rb\n")
      ['[]', '["first", "first"]', '["../outside"]', '{'].each do |catalog|
        File.write(File.join(directory, 'exercises/catalog.json'), catalog)

        assert_match(/Invalid exercise catalog/, offenses(directory).join)
      end
    end
  end

  private

  # Runs the real cop against an isolated curriculum and returns its diagnostics.
  def offenses(directory)
    output, errors, status = Open3.capture3(RbConfig.ruby, Gem.bin_path('rubocop', 'rubocop'),
                                            '--only', 'Rkoans/Curriculum', '--cache', 'true',
                                            '--cache-root', File.join(directory, '.cache'),
                                            '--format', 'json', 'rkoans.gemspec', chdir: directory)

    assert_includes [0, 1], status.exitstatus, errors
    JSON.parse(output).fetch('files').flat_map do |file|
      file.fetch('offenses').map { |offense| offense.fetch('message') }
    end
  end
end
