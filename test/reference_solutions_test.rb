# frozen_string_literal: true

require 'test_helper'
require 'tmpdir'
require_relative 'support/rails_support'

class ReferenceSolutionsTest < Minitest::Test
  include RailsSupport

  def test_each_reference_passes_its_exercise_checks
    Dir.mktmpdir do |directory|
      Rkoans::Catalog.new.ids.each do |id|
        exercise = Rkoans::Exercise.new(directory: directory, id: id)
        exercise.prepare
        apply_references(exercise)
        runtime = Rkoans::RailsRuntime.new(directory: RAILS_CACHE)
        result = Rkoans::Checker.new(rails_runtime: runtime).run(exercise)

        assert_equal 0, result.exit_code, result.output
      end
    end
  end
end
