# frozen_string_literal: true

require ARGV.shift
class ConstantScopeTest < Minitest::Test
  # Checks scope predictions.
  def test_scope_predictions
    assert_equal({ lexical_label: 'item', shared_class_count: 1, new_block_local_visible: false }, Exercises::ConstantScope.predictions)
  end

  # Checks local closure state.
  def test_local_closure_state
    a = Exercises::ConstantScope.counter

    b = Exercises::ConstantScope.counter

    assert_equal [1, 2, 1], [a.call, a.call, b.call]
  end
end
