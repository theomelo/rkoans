# frozen_string_literal: true

require 'test_helper'
require 'tmpdir'
require 'stringio'

class ApplicationSessionTest < Minitest::Test
  # Learners must see both files to edit and both files to compare after passing.
  def test_application_displays_all_editable_and_reference_files
    root = File.expand_path('fixtures/rails_curriculum', __dir__)
    catalog = Rkoans::Catalog.new(root: root)
    Dir.mktmpdir do |directory|
      exercise = Rkoans::Exercise.new(directory: directory, catalog: catalog)
      out = StringIO.new
      view = Rkoans::TerminalView.new(out: out, catalog: catalog)
      view.render(exercise: exercise, result: Rkoans::Checker::Result.new('failure', 1),
                  completed: [], watching: false)

      exercise.editable_files.each { |path| assert_includes out.string, path }
      out.truncate(0)
      out.rewind
      view.render(exercise: exercise, result: Rkoans::Checker::Result.new('success', 0),
                  completed: [], watching: true)

      exercise.reference_files.each_value { |path| assert_includes out.string, path }
    end
  end
end
