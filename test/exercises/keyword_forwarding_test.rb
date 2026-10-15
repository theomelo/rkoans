# frozen_string_literal: true

# Explicit callable arguments demonstrate block and proc behavior.
# rubocop:disable Style/SymbolProc

require ARGV.shift
class KeywordForwardingTest < Minitest::Test
  # Checks keyword and block.
  def test_keyword_and_block
    assert_equal 'RUBY!', Exercises::KeywordForwarding.forward('ruby', suffix: '!') { |v|
      v.upcase
    }
    assert_equal 'ruby?', Exercises::KeywordForwarding.forward('ruby')
  end

  # Checks positional hash.
  def test_positional_hash
    assert_equal 'rails!', Exercises::KeywordForwarding.forward({ name: 'rails' }, suffix: '!') { |payload| payload.fetch(:name) }
  end
end

# rubocop:enable Style/SymbolProc
