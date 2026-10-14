# frozen_string_literal: true

# SPDX-License-Identifier: CC-BY-NC-SA-3.0
# Adapted from Ruby Koans by Jim Weirich and Joe O'Brien.
# See THIRD_PARTY_NOTICES.md for attribution and license terms.

require ARGV.shift

# Observes symbols without interning the names being searched for as expectations.
class AboutSymbolsTest < Minitest::Test
  RUBY_CONSTANT = 'What is the sound of one hand clapping?'

  # Symbols have their own type.
  def test_symbols_are_symbols
    symbol = :ruby

    assert_equal Exercises::AboutSymbols.koans[:symbol_type], symbol.is_a?(Symbol)
  end

  # Equal names compare equally; different names do not.
  def test_symbols_can_be_compared
    symbol1 = :a_symbol
    symbol2 = :a_symbol
    symbol3 = :something_else
    answers = Exercises::AboutSymbols.koans

    assert_equal answers[:same_value], symbol1 == symbol2
    assert_equal answers[:different_value], symbol1 == symbol3
  end

  # Identical symbols share identity as well as value.
  def test_identical_symbols_are_a_single_internal_object
    symbol1 = :a_symbol
    symbol2 = :a_symbol
    answers = Exercises::AboutSymbols.koans

    assert_equal answers[:identical_value], symbol1 == symbol2
    assert_equal answers[:same_object], symbol1.equal?(symbol2)
  end

  # Defined method names occur in the symbol table.
  def test_method_names_become_symbols
    names = Symbol.all_symbols.map(&:to_s)

    assert_equal Exercises::AboutSymbols.koans[:method_name_registered],
                 names.include?('test_method_names_become_symbols')
  end

  # Constant names are compared as strings to avoid creating a searched-for symbol.
  def test_constants_become_symbols
    names = Symbol.all_symbols.map(&:to_s)
    constant_name = self.class.constants(false).fetch(0).to_s
    answers = Exercises::AboutSymbols.koans

    assert_equal answers[:constant_name], constant_name
    assert_equal answers[:constant_registered], names.include?(constant_name)
  end

  # Strings can be converted into symbols.
  def test_symbols_can_be_made_from_strings
    string = 'catsAndDogs'

    assert_equal Exercises::AboutSymbols.koans[:from_string], string.to_sym
  end

  # Quoting permits spaces inside symbol names.
  def test_symbols_with_spaces_can_be_built
    symbol = :'cats and dogs'

    assert_equal Exercises::AboutSymbols.koans[:with_spaces], symbol
  end

  # Double-quoted symbol syntax supports interpolation.
  def test_symbols_with_interpolation_can_be_built
    value = 'and'
    symbol = :"cats #{value} dogs"

    assert_equal Exercises::AboutSymbols.koans[:with_interpolation], symbol
  end

  # String interpolation calls a symbol's to_s.
  def test_to_s_is_called_on_interpolated_symbols
    symbol = :cats
    string = "It is raining #{symbol} and dogs."

    assert_equal Exercises::AboutSymbols.koans[:interpolated_text], string
  end

  # A symbol and a string with the same spelling are different values and types.
  def test_symbols_are_not_strings
    symbol = :ruby
    answers = Exercises::AboutSymbols.koans

    assert_equal answers[:string_type], symbol.is_a?(String)
    assert_equal answers[:equals_string], symbol.eql?('ruby')
  end

  # Symbols do not provide these string operations.
  def test_symbols_do_not_have_string_methods
    symbol = :not_a_string
    answers = Exercises::AboutSymbols.koans

    assert_equal answers[:each_char], symbol.respond_to?(:each_char)
    assert_equal answers[:reverse], symbol.respond_to?(:reverse)
  end

  # Unsupported concatenation raises an exception whose class can be predicted.
  def test_symbols_cannot_be_concatenated
    error = assert_raises(NoMethodError) { :cats + :dogs }

    assert_equal Exercises::AboutSymbols.koans[:concatenation_error], error.class
  end

  # A constructed string can be converted to a symbol.
  def test_symbols_can_be_dynamically_created
    name = 'cats' + 'dogs' # rubocop:disable Style/StringConcatenation

    assert_equal Exercises::AboutSymbols.koans[:dynamically_created], name.to_sym
  end
end
