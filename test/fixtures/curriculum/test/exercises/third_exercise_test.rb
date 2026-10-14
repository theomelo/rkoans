# frozen_string_literal: true

require 'minitest/autorun'
require ARGV.shift

class ThirdFixtureExerciseTest < Minitest::Test
  def test_completion
    assert THIRD_EXERCISE_COMPLETE
  end
end
