# frozen_string_literal: true

# The examples contrast block forms and their behavior.
# rubocop:disable Style/BlockDelimiters

require ARGV.shift
class CoreProtocolsTest < Minitest::Test
  # Checks enumerable protocol.
  def test_enumerable_protocol
    p = Exercises::CoreProtocols::Packet.new([2, 3]); assert_equal([4, 6], p.map { |n|
      n * 2
    })
    assert_equal [2, 3], p.each.to_a
    assert_equal [true, true], Exercises::CoreProtocols.protocol(p)
  end

  # Checks comparable and conversion.
  def test_comparable_and_conversion
    a = Exercises::CoreProtocols::Packet.new([1])
    b = Exercises::CoreProtocols::Packet.new([2, 3])

    assert_operator a, :<, b
    assert_equal 'Packet(5)', b.to_s
    assert_equal [a, b], [b, a].sort
  end
end

# rubocop:enable Style/BlockDelimiters
