# frozen_string_literal: true

require 'test_helper'
require 'tmpdir'
require 'open3'
require 'json'
require 'rubocop'

class CurriculumCopTest < Minitest::Test
  def test_complete_curriculum_and_missing_asset_diagnostics
    with_curriculum do |directory|
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

  # Several defects must appear together, even though RuboCop uses one source range.
  def test_reports_multiple_curriculum_defects_together
    with_curriculum do |directory|
      FileUtils.mkdir_p(File.join(directory, 'exercises/unregistered'))
      File.delete(File.join(directory, 'exercises/first-exercise/hint.md'))
      File.delete(File.join(directory, 'sig/exercises/second_exercise.rbs'))

      assert_equal [
        'Missing curriculum asset: exercises/first-exercise/hint.md',
        'Missing curriculum asset: sig/exercises/second_exercise.rbs',
        'Exercise directory is not registered: unregistered'
      ], offenses(directory).flat_map(&:lines).map(&:chomp)
    end
  end

  def test_invalid_catalog_is_reported_as_an_offense
    Dir.mktmpdir do |directory|
      root = File.expand_path('..', __dir__)
      copy_cop(root, directory)
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

  # Yields a complete fixture curriculum with the custom cop enabled.
  def with_curriculum
    Dir.mktmpdir do |directory|
      root = File.expand_path('..', __dir__)
      FileUtils.cp_r(File.join(root, 'test/fixtures/curriculum/.'), directory)
      copy_cop(root, directory)
      File.write(File.join(directory, 'rkoans.gemspec'), "Gem::Specification.new\n")
      File.write(File.join(directory, '.rubocop.yml'), <<~YAML)
        require:
          - ./tools/rubocop/curriculum.rb
        Rkoans/Curriculum:
          Enabled: true
          Include:
            - rkoans.gemspec
      YAML

      yield directory
    end
  end

  # Copies the development cop and the shared catalog loader into an isolated gem.
  def copy_cop(root, directory)
    FileUtils.mkdir_p(File.join(directory, 'tools/rubocop'))
    FileUtils.cp(File.join(root, 'tools/rubocop/curriculum.rb'), File.join(directory, 'tools/rubocop'))
    FileUtils.mkdir_p(File.join(directory, 'lib/rkoans'))
    %w[catalog.rb error.rb].each do |name|
      FileUtils.cp(File.join(root, 'lib/rkoans', name), File.join(directory, 'lib/rkoans'))
    end
  end

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
