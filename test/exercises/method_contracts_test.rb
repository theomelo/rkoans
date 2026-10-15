# frozen_string_literal: true

# The original descriptive check identifiers and example strings remain intact.
# The examples contrast block forms and their behavior.
# Explicit callable arguments demonstrate block and proc behavior.
# rubocop:disable Layout/LineLength, Style/BlockDelimiters, Style/SymbolProc

require ARGV.shift
class MethodContractsTest < Minitest::Test
  # Checks method defaults and block.
  def test_method_defaults_and_block
    assert_equal 'tea:1:box:0:normal', Exercises::MethodContracts.format_order('tea', unit: 'box')
    assert_equal 'TEA:2:BOX:1:HIGH', Exercises::MethodContracts.format_order('tea', 2, :gift, unit: 'box', priority: 'high') { |v|
      v.upcase
    }
  end

  # Checks parameter metadata.
  def test_parameter_metadata
    assert_equal [%i[req name], %i[opt quantity], %i[rest extras], %i[keyreq unit], %i[keyrest options], %i[block block]],
                 Exercises::MethodContracts.parameters
    assert_raises(ArgumentError) {
      Exercises::MethodContracts.format_order('tea')
    }
  end
end

# rubocop:enable Layout/LineLength, Style/BlockDelimiters, Style/SymbolProc
