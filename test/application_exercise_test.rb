# frozen_string_literal: true

require 'test_helper'
require 'tmpdir'
require 'json'

class ApplicationExerciseTest < Minitest::Test
  ROOT = File.expand_path('fixtures/rails_curriculum', __dir__)

  # Preparing again fills missing scaffold files without replacing either edited file.
  def test_preparation_preserves_edits_and_completes_partial_workspaces
    Dir.mktmpdir do |directory|
      exercise = Rkoans::Exercise.new(directory: directory, catalog: Rkoans::Catalog.new(root: ROOT))
      exercise.prepare
      files = exercise.editable_files

      assert_equal(%w[config/routes.rb app/controllers/welcome_controller.rb],
                   files.map { |path| path.delete_prefix("#{exercise.workspace}/") })
      assert_equal 'rails', exercise.runtime
      files.each { |path| File.write(path, '# personal edits') }
      File.unlink(File.join(exercise.workspace, 'config/environment.rb'))
      exercise.prepare

      files.each { |path| assert_equal '# personal edits', File.read(path) }
      assert_path_exists File.join(exercise.workspace, 'config/environment.rb')
      assert_equal files.first, exercise.solution
      assert_equal files, exercise.reference_files.keys
    end
  end

  # Descriptor paths cannot escape, duplicate files, or name an undeclared primary file.
  def test_invalid_descriptors_are_rejected
    Dir.mktmpdir do |directory|
      FileUtils.cp_r(ROOT, File.join(directory, 'catalog'))
      root = File.join(directory, 'catalog')
      path = File.join(root, 'exercises/route-example/exercise.json')
      original = JSON.parse(File.read(path))
      [
        { 'runtime' => 'unknown' },
        { 'files' => ['../outside'] },
        { 'files' => ['/outside'] },
        { 'files' => ['config/routes.rb', 'config/routes.rb'] },
        { 'editable_paths' => ['unlisted.rb'] },
        { 'primary_path' => 'config/environment.rb' }
      ].each do |change|
        File.write(path, JSON.generate(original.merge(change)))

        assert_raises(Rkoans::Error) { Rkoans::Exercise.new(directory: directory, catalog: Rkoans::Catalog.new(root: root)) }
      end
    end
  end

  # A destination symlink must never redirect scaffold writes outside the workspace.
  def test_symlinked_destination_is_rejected_without_altering_outside_files
    Dir.mktmpdir do |directory|
      outside = File.join(directory, 'outside')
      FileUtils.mkdir_p(outside)
      File.write(File.join(outside, 'routes.rb'), 'sentinel')
      exercise = Rkoans::Exercise.new(directory: directory, catalog: Rkoans::Catalog.new(root: ROOT))
      FileUtils.mkdir_p(exercise.workspace)
      File.symlink(outside, File.join(exercise.workspace, 'config'))

      assert_raises(Rkoans::Error) { exercise.prepare }
      assert_equal 'sentinel', File.read(File.join(outside, 'routes.rb'))
      refute_path_exists File.join(outside, 'application.rb')
    end
  end
end
