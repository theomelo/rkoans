# frozen_string_literal: true

require ARGV.shift
class DelegationTest < Minitest::Test
  # Checks delegation receiver.
  def test_delegation_receiver
    items = []
    box = Exercises::Delegation::Mailbox.new(items)

    assert_same items, box.push('ruby')
    assert_equal ['ruby'], items
    assert_equal 1, box.size
  end

  # Checks live receiver.
  def test_live_receiver
    items = []
    box = Exercises::Delegation::Mailbox.new(items)
    items << 'rails'

    assert_equal 1, box.size
  end
end
