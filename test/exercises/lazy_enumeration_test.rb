# frozen_string_literal: true

require ARGV.shift
class LazyEnumerationTest < Minitest::Test
  # Checks lazy limit.
  def test_lazy_limit
    assert_equal [7, 14], Exercises::LazyEnumeration.first_multiples(2)
    assert_equal [7, 14, 21, 28], Exercises::LazyEnumeration.first_multiples(4)
  end

  # Checks empty limit.
  def test_empty_limit
    assert_equal [], Exercises::LazyEnumeration.first_multiples(0)
  end
end
