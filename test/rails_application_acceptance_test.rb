# frozen_string_literal: true

require 'test_helper'
require 'tmpdir'
require_relative 'support/rails_support'

class RailsApplicationAcceptanceTest < Minitest::Test
  include RailsSupport

  # A real application must distinguish a full repair from either half and a catch-all.
  def test_real_rails_starter_reference_and_partial_repairs
    catalog = Rkoans::Catalog.new(root: RAILS_FIXTURE)
    checker = Rkoans::Checker.new(rails_runtime: prepared_runtime)
    Dir.mktmpdir do |directory|
      exercise = Rkoans::Exercise.new(directory: directory, catalog: catalog)
      exercise.prepare
      starter = exercise.editable_files.to_h { |file| [file, File.read(file)] }
      result = checker.run(exercise)

      assert_equal 1, result.exit_code, result.output
      assert_includes result.output, '0 errors'
      apply_references(exercise)
      result = checker.run(exercise)

      assert_equal 0, result.exit_code, result.output
      exercise.editable_files.each do |file|
        File.write(file, starter.fetch(file))
        result = checker.run(exercise)

        assert_equal 1, result.exit_code, result.output
        assert_includes result.output, 'test_hello_route'
        assert_includes result.output, '0 errors'
        apply_references(exercise)
      end
      File.open(exercise.solution, 'a') do |file|
        file.puts "Rails.application.routes.append { get '*path', to: 'welcome#index' }"
      end
      result = checker.run(exercise)

      assert_equal 1, result.exit_code, result.output
      assert_includes result.output, 'test_unknown_route'
      assert_includes result.output, '0 errors'
    end
  end

  # Syntax errors in learner controllers must be visible and a repair must recover.
  def test_controller_syntax_error_is_visible_and_recoverable
    catalog = Rkoans::Catalog.new(root: RAILS_FIXTURE)
    checker = Rkoans::Checker.new(rails_runtime: prepared_runtime)
    Dir.mktmpdir do |directory|
      exercise = Rkoans::Exercise.new(directory: directory, catalog: catalog)
      exercise.prepare
      apply_references(exercise)
      controller = exercise.editable_files.last
      File.write(controller, "class WelcomeController <\n")
      result = checker.run(exercise)

      assert_equal 1, result.exit_code, result.output
      assert_includes result.output, 'SyntaxError'
      apply_references(exercise)

      assert_equal 0, checker.run(exercise).exit_code
    end
  end
end
