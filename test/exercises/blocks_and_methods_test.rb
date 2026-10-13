# frozen_string_literal: true

require ARGV.shift

# Checks the learner's sequence and the block invocation contract.
class BlocksAndMethodsTest < Minitest::Test
  def test_block_koan
    assert_equal [1, 2, 3], Exercises::BlocksAndMethods.koans[:sequence]
  end

  def test_apply_block
    count = 0
    result = Exercises::BlocksAndMethods.apply(5) do |number|
      count += 1
      number * 3
    end

    assert_equal 15, result
    assert_equal 1, count
    assert_raises(LocalJumpError) { Exercises::BlocksAndMethods.apply(5) }
  end
end
