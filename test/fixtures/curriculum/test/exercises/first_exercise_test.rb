# frozen_string_literal: true

require 'minitest/autorun'
require ARGV.shift

class FirstFixtureExerciseTest < Minitest::Test
  def test_completion
    assert FIRST_EXERCISE_COMPLETE
  end
end
