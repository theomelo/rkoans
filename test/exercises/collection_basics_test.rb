# frozen_string_literal: true

require ARGV.shift

# Checks the learner's expectations and the double_odds contract.
class CollectionBasicsTest < Minitest::Test
  def test_collection_koans
    assert_equal({ mapped: [2, 4, 6], selected: [1, 3] }, Exercises::CollectionBasics.koans)
  end

  def test_double_odds
    input = [1, 2, 3]

    assert_equal [2, 6], Exercises::CollectionBasics.double_odds(input)
    assert_equal [1, 2, 3], input
    assert_empty Exercises::CollectionBasics.double_odds([])
  end
end
