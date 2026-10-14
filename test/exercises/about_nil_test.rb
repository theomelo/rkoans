# frozen_string_literal: true

# SPDX-License-Identifier: CC-BY-NC-SA-3.0
# Adapted from Ruby Koans by Jim Weirich and Joe O'Brien.
# See THIRD_PARTY_NOTICES.md for attribution and license terms.

require ARGV.shift

# Observes nil as an object with methods and ordinary missing-method errors.
class AboutNilTest < Minitest::Test
  # Nil is an object rather than an absent receiver.
  def test_nil_is_an_object
    assert_equal Exercises::AboutNil.koans[:nil_object], nil.is_a?(Object)
  end

  # Missing methods raise an error with an inspectable class and message.
  def test_you_dont_get_null_pointer_errors_when_calling_methods_on_nil
    error = assert_raises(NoMethodError) { nil.some_method_nil_doesnt_know_about }
    answers = Exercises::AboutNil.koans

    assert_equal answers[:missing_method_error], error.class
    assert_kind_of String, answers[:message_fragment]
    refute_empty answers[:message_fragment]
    assert_includes error.message, answers[:message_fragment]
  end

  # Nil supports a predicate, string conversion, and inspection.
  def test_nil_has_a_few_methods_defined_on_it
    answers = Exercises::AboutNil.koans

    assert_equal answers[:nil_predicate], nil.nil?
    assert_equal answers[:string_value], nil.to_s
    assert_equal answers[:inspected_value], nil.inspect
  end
end
