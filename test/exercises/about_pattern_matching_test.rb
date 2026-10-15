# frozen_string_literal: true

# Literal conditions isolate the control-flow behavior being predicted.
# The example demonstrates that an unpinned variable pattern always binds the subject.
# Keep the related original chapter examples together.
# rubocop:disable Lint/LiteralAsCondition, Lint/UnreachablePatternBranch, Metrics/ClassLength

# SPDX-License-Identifier: CC-BY-NC-SA-3.0
# Adapted from Ruby Koans by Jim Weirich and Joe O'Brien.
# See THIRD_PARTY_NOTICES.md for attribution and license terms.

require ARGV.shift
class AboutPatternMatchingTest < Minitest::Test
  # Checks pattern may not match.
  def test_pattern_may_not_match
    case [true, false]
    in [a, b] if a == b # The condition after pattern is called guard.
      :match
    end
  rescue NoMatchingPatternError => e
    # What exception has been caught?
    assert_equal Exercises::AboutPatternMatching.koans.fetch(:pattern_may_not_match_one), (e.class)
  end

  # Checks we can use else.
  def test_we_can_use_else
    result = case [true, false]
             in [a, b] if a == b
               :match
             else
               :no_match
             end

    assert_equal Exercises::AboutPatternMatching.koans.fetch(:we_can_use_else_one), result
  end

  # ------------------------------------------------------------------

  # Demonstrates value pattern.
  def value_pattern(variable)
    case variable
    in 0
      :match_exact_value
    in 1..10
      :match_in_range
    in Integer
      :match_with_class
    else
      :no_match
    end
  end

  # Checks value pattern.
  def test_value_pattern
    assert_equal Exercises::AboutPatternMatching.koans.fetch(:value_pattern_one), value_pattern(0)
    assert_equal Exercises::AboutPatternMatching.koans.fetch(:value_pattern_two), value_pattern(5)
    assert_equal Exercises::AboutPatternMatching.koans.fetch(:value_pattern_three), value_pattern(100)
    assert_equal Exercises::AboutPatternMatching.koans.fetch(:value_pattern_four), value_pattern('Not a Number!')
  end

  # ------------------------------------------------------------------
  # This pattern will bind variable to the value

  # Demonstrates variable pattern with binding.
  def variable_pattern_with_binding(variable)
    case 0
    in variable
      variable
    else
      :no_match
    end
  end

  # Checks variable pattern with binding.
  def test_variable_pattern_with_binding
    assert_equal Exercises::AboutPatternMatching.koans.fetch(:variable_pattern_with_binding_one),
                 variable_pattern_with_binding(1)
  end

  # ------------------------------------------------------------------

  # We can pin the value of the variable with ^

  # Demonstrates variable pattern with pin.
  def variable_pattern_with_pin(variable)
    case 0
    in ^variable
      variable
    else
      :no_match
    end
  end

  # Checks variable pattern with pin.
  def test_variable_pattern_with_pin
    assert_equal Exercises::AboutPatternMatching.koans.fetch(:variable_pattern_with_pin_one),
                 variable_pattern_with_pin(1)
  end

  # ------------------------------------------------------------------

  # We can drop values from pattern

  # Demonstrates pattern with dropping.
  def pattern_with_dropping(variable)
    case variable
    in [_, 2]
      :match
    else
      :no_match
    end
  end

  # Checks pattern with dropping.
  def test_pattern_with_dropping
    assert_equal Exercises::AboutPatternMatching.koans.fetch(:pattern_with_dropping_one),
                 pattern_with_dropping(['I will not be checked', 2])
    assert_equal Exercises::AboutPatternMatching.koans.fetch(:pattern_with_dropping_two),
                 pattern_with_dropping(['I will not be checked', 'But I will!'])
  end

  # ------------------------------------------------------------------

  # We can use logical *or* in patterns

  # Demonstrates alternative pattern.
  def alternative_pattern(variable)
    case variable
    in 0 | false | nil
      :match
    else
      :no_match
    end
  end

  # Checks alternative pattern.
  def test_alternative_pattern
    assert_equal Exercises::AboutPatternMatching.koans.fetch(:alternative_pattern_one), alternative_pattern(0)
    assert_equal Exercises::AboutPatternMatching.koans.fetch(:alternative_pattern_two), alternative_pattern(false)
    assert_equal Exercises::AboutPatternMatching.koans.fetch(:alternative_pattern_three), alternative_pattern(nil)
    assert_equal Exercises::AboutPatternMatching.koans.fetch(:alternative_pattern_four), alternative_pattern(4)
  end

  # ------------------------------------------------------------------

  # As pattern binds the variable to the value if pattern matches
  # pat: pat => var

  # Demonstrates as pattern.
  def as_pattern
    a = 'First I was afraid'

    case 'I was petrified'
    in String => a
      a
    else
      :no_match
    end
  end

  # Checks as pattern.
  def test_as_pattern
    assert_equal Exercises::AboutPatternMatching.koans.fetch(:as_pattern_one), as_pattern
  end

  # ------------------------------------------------------------------

  # Array pattern works with all objects that have #deconstruct method that returns Array
  # It is useful to cut needed parts from Array-ish objects

  class Deconstructible
    # Demonstrates initialize.
    def initialize(str)
      @data = str
    end

    # Demonstrates deconstruct.
    def deconstruct
      @data&.chars
    end
  end

  # Demonstrates array pattern.
  def array_pattern(deconstructible)
    case deconstructible
    in 'a', *res, 'd'
      res
    else
      :no_match
    end
  end

  # Checks array pattern.
  def test_array_pattern
    assert_equal Exercises::AboutPatternMatching.koans.fetch(:array_pattern_one),
                 array_pattern(Deconstructible.new('abcd'))
    assert_equal Exercises::AboutPatternMatching.koans.fetch(:array_pattern_two),
                 array_pattern(Deconstructible.new('123'))
  end

  # ------------------------------------------------------------------

  # Hash pattern is quite the same as Array pattern, but it expects #deconsturct_keys(keys) method
  # It works with symbol keys for now

  class LetterAccountant
    # Demonstrates initialize.
    def initialize(str)
      @data = str
    end

    # Demonstrates deconstruct keys.
    def deconstruct_keys(keys)
      # we will count number of occurrences of each key in our data
      keys.to_h { |key| [key, @data.count(key.to_s)] }
    end
  end

  # Demonstrates hash pattern.
  def hash_pattern(deconstructible_as_hash)
    case deconstructible_as_hash
    in { a: a, b: b }
      [a, b]
    else
      :no_match
    end
  end

  # Checks hash pattern.
  def test_hash_pattern
    assert_equal Exercises::AboutPatternMatching.koans.fetch(:hash_pattern_one),
                 hash_pattern(LetterAccountant.new('aaabbc'))
    assert_equal Exercises::AboutPatternMatching.koans.fetch(:hash_pattern_two),
                 hash_pattern(LetterAccountant.new('xyz'))
  end

  # we can write it even shorter
  # Demonstrates hash pattern with sugar.
  def hash_pattern_with_sugar(deconstructible_as_hash)
    case deconstructible_as_hash
    in a:, b:
      [a, b]
    else
      :no_match
    end
  end

  # Checks hash pattern with sugar.
  def test_hash_pattern_with_sugar
    assert_equal Exercises::AboutPatternMatching.koans.fetch(:hash_pattern_with_sugar_one),
                 hash_pattern_with_sugar(LetterAccountant.new('aaabbc'))
    assert_equal Exercises::AboutPatternMatching.koans.fetch(:hash_pattern_with_sugar_two),
                 hash_pattern_with_sugar(LetterAccountant.new('xyz'))
  end
end

# rubocop:enable Lint/LiteralAsCondition, Lint/UnreachablePatternBranch, Metrics/ClassLength
