# frozen_string_literal: true

require ARGV.shift
class MethodLookupTest < Minitest::Test
  # Checks prepend wrapper.
  def test_prepend_wrapper
    assert_equal '[base]', Exercises::MethodLookup::Presenter.new.call
  end

  # Checks ancestor order.
  def test_ancestor_order
    assert_equal ['Exercises::MethodLookup::Wrapper', 'Exercises::MethodLookup::Presenter'], Exercises::MethodLookup.lookup
  end
end
