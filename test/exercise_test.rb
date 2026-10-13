# frozen_string_literal: true

require 'test_helper'
require 'tmpdir'

class ExerciseTest < Minitest::Test
  def test_start_preserves_existing_class_named_files
    Dir.mktmpdir do |directory|
      Rkoans::Exercise::IDS.each do |id|
        exercise = Rkoans::Exercise.new(directory: directory, id: id)
        exercise.prepare
        File.write(exercise.solution, '# my edits')
        exercise.prepare

        assert_equal '# my edits', File.read(exercise.solution)
      end
    end
  end
end
