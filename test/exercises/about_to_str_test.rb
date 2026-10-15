# frozen_string_literal: true

# SPDX-License-Identifier: CC-BY-NC-SA-3.0
# Adapted from Ruby Koans by Jim Weirich and Joe O'Brien.
# See THIRD_PARTY_NOTICES.md for attribution and license terms.

require ARGV.shift
require 'tmpdir'

class AboutToStrTest < Minitest::Test
  class CanNotBeTreatedAsString
    # Demonstrates to s.
    def to_s
      'non-string-like'
    end
  end

  # Checks to s returns a string representation.
  def test_to_s_returns_a_string_representation
    not_like_a_string = CanNotBeTreatedAsString.new

    assert_equal Exercises::AboutToStr.koans.fetch(:to_s_returns_a_string_representation_one), not_like_a_string.to_s
  end

  # Checks normally objects cannot be used where strings are expected.
  def test_normally_objects_cannot_be_used_where_strings_are_expected
    assert_predicted_error(:normally_objects_cannot_be_used_where_strings_are_expected_one, ::TypeError) do
      File.exist?(CanNotBeTreatedAsString.new)
    end
  end

  # ------------------------------------------------------------------

  class CanBeTreatedAsString
    # Demonstrates to s.
    def to_s
      'string-like'
    end

    # Demonstrates to str.
    def to_str
      to_s
    end
  end

  # Checks to str also returns a string representation.
  def test_to_str_also_returns_a_string_representation
    like_a_string = CanBeTreatedAsString.new

    assert_equal Exercises::AboutToStr.koans.fetch(:to_str_also_returns_a_string_representation_one),
                 like_a_string.to_str
  end

  # Checks to str allows objects to be treated as strings.
  def test_to_str_allows_objects_to_be_treated_as_strings
    Dir.mktmpdir do |directory|
      Dir.chdir(directory) do
        assert_equal Exercises::AboutToStr.koans.fetch(:to_str_allows_objects_to_be_treated_as_strings_one),
                     File.exist?(CanBeTreatedAsString.new)
      end
    end
  end

  # ------------------------------------------------------------------

  # Demonstrates acts like a string?.
  def acts_like_a_string?(string)
    string = string.to_str if string.respond_to?(:to_str)
    string.is_a?(String)
  end

  # Checks user defined code can check for to str.
  def test_user_defined_code_can_check_for_to_str
    assert_equal Exercises::AboutToStr.koans.fetch(:user_defined_code_can_check_for_to_str_one),
                 acts_like_a_string?(CanNotBeTreatedAsString.new)
    assert_equal Exercises::AboutToStr.koans.fetch(:user_defined_code_can_check_for_to_str_two),
                 acts_like_a_string?(CanBeTreatedAsString.new)
  end

  # Checks the predicted exception class while returning the captured error.
  # @param key [Symbol] answer field
  # @param klass [Class<Exception>] exception raised by the example
  # @return [Exception]
  def assert_predicted_error(key, ...)
    error = assert_raises(...)
    assert_equal Exercises::AboutToStr.koans.fetch(key), error.class
    error
  end
end
