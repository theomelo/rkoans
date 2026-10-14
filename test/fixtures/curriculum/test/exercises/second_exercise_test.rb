# frozen_string_literal: true

require 'minitest/autorun'
require ARGV.shift

class SecondFixtureExerciseTest < Minitest::Test
  def test_completion
    assert SECOND_EXERCISE_COMPLETE
  end
end
