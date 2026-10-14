# frozen_string_literal: true

require 'test_helper'
require 'tmpdir'

class SharedRowsAcceptanceTest < Minitest::Test
  # Reject sharing within a result and caching mutable rows across calls.
  def test_shared_and_cached_rows_are_rejected
    Dir.mktmpdir do |directory|
      exercise = Rkoans::Exercise.new(directory: directory, id: 'shared-rows')
      exercise.prepare
      reference = File.read(exercise.reference)
      cases = [
        ['Array.new(count, [])', 'test_independent_rows'],
        ['(@rows ||= {})[count] ||= Array.new(count) { [] }', 'test_fresh_rows_on_each_call']
      ]
      cases.each do |replacement, check|
        File.write(exercise.solution, reference.sub('Array.new(count) { [] }', replacement))
        result = Rkoans::Checker.new.run(exercise)

        assert_equal 1, result.exit_code, result.output
        assert_includes result.output, check
        assert_includes result.output, '1 failures'
      end
    end
  end
end
