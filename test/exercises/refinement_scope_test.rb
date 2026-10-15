# frozen_string_literal: true

require ARGV.shift
class RefinementScopeTest < Minitest::Test
  # Checks lexical refinement.
  def test_lexical_refinement
    assert_equal 'local', Exercises::RefinementScope::Local.call
  end

  # Checks outside unchanged.
  def test_outside_unchanged
    assert_equal 'plain', Exercises::RefinementScope.outside
  end
end
