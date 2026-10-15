# frozen_string_literal: true

require ARGV.shift
class VisibilityTest < Minitest::Test
  # Checks protected peer calls.
  def test_protected_peer_calls
    a = Exercises::Visibility::Wallet.new(5)
    b = Exercises::Visibility::Wallet.new(8)

    assert_equal(-1, a.compare(b))
    assert_raises(NoMethodError) { a.balance }
  end

  # Checks private normalization.
  def test_private_normalization
    wallet = Exercises::Visibility::Wallet.new(5)

    assert_equal 8, wallet.deposit(-3)
    assert_includes wallet.private_methods, :normalize
    assert_raises(NoMethodError) { wallet.normalize(-3) }
  end
end
