# frozen_string_literal: true

require ARGV.shift
class PatternMatchingTest < Minitest::Test
  # Checks pinned kind.
  def test_pinned_kind
    assert_equal 5, Exercises::PatternMatching.amount({ type: 'sale', amount: 5, extra: true }, 'sale')
    assert_nil Exercises::PatternMatching.amount({ type: 'refund', amount: 5 }, 'sale')
  end

  # Checks pattern guard.
  def test_pattern_guard
    assert_nil Exercises::PatternMatching.amount({ type: 'sale', amount: 0 }, 'sale')

    assert_nil Exercises::PatternMatching.amount({ type: 'sale', amount: '5' }, 'sale')
    assert_nil Exercises::PatternMatching.amount({}, 'sale')
  end
end
