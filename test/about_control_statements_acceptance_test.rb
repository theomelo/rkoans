# frozen_string_literal: true

require 'test_helper'
require 'tmpdir'

class AboutControlStatementsAcceptanceTest < Minitest::Test
  # Incorrect predictions must fail the examples they describe.
  def test_incorrect_predictions_are_rejected
    Dir.mktmpdir do |directory|
      exercise = Rkoans::Exercise.new(directory: directory, id: 'about-control-statements')
      exercise.prepare
      reference = File.read(exercise.reference)
      cases = [
        ['if_statements_with_no_else_with_false_condition_return_value_one', "''",
         'test_if_statements_with_no_else_with_false_condition_return_value'],
        ['if_then_else_statements_one', '"incorrect prediction"', 'test_if_then_else_statements']
      ]
      cases.each do |key, answer, check|
        File.write(exercise.solution, reference.sub(/#{key}: .*/, "#{key}: #{answer},"))
        result = Rkoans::Checker.new.run(exercise)

        assert_equal 1, result.exit_code, result.output
        assert_includes result.output, check
      end
    end
  end
end
