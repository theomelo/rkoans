# frozen_string_literal: true

# SPDX-License-Identifier: CC-BY-NC-SA-3.0
# Adapted from Ruby Koans by Jim Weirich and Joe O'Brien.
# See THIRD_PARTY_NOTICES.md for attribution and license terms.

module Exercises
  # Predicts symbol identity, conversions, registered names, and supported operations.
  class AboutSymbols
    # Replace each :fill_me_in with the result of its example.
    # @return [Hash<Symbol, Boolean | Symbol | String | Class>]
    def self.koans
      {
        # :ruby.is_a?(Symbol)
        symbol_type: :fill_me_in,
        # :a_symbol == :a_symbol
        same_value: :fill_me_in,
        # :a_symbol == :something_else
        different_value: :fill_me_in,
        # :a_symbol == :a_symbol
        identical_value: :fill_me_in,
        # :a_symbol.equal?(:a_symbol)
        same_object: :fill_me_in,
        # Symbol.all_symbols.map(&:to_s).include?('test_method_names_become_symbols')
        method_name_registered: :fill_me_in,
        # name of the constant declared by the check class
        constant_name: :fill_me_in,
        # Symbol.all_symbols.map(&:to_s).include?('RUBY_CONSTANT')
        constant_registered: :fill_me_in,
        # 'catsAndDogs'.to_sym
        from_string: :fill_me_in,
        # :'cats and dogs'
        with_spaces: :fill_me_in,
        # value = 'and'; :"cats #{value} dogs"
        with_interpolation: :fill_me_in,
        # symbol = :cats; "It is raining #{symbol} and dogs."
        interpolated_text: :fill_me_in,
        # :ruby.is_a?(String)
        string_type: :fill_me_in,
        # :ruby.eql?('ruby')
        equals_string: :fill_me_in,
        # :not_a_string.respond_to?(:each_char)
        each_char: :fill_me_in,
        # :not_a_string.respond_to?(:reverse)
        reverse: :fill_me_in,
        # exception class raised by :cats + :dogs
        concatenation_error: :fill_me_in,
        # ('cats' + 'dogs').to_sym
        dynamically_created: :fill_me_in
      }
    end
  end
end
