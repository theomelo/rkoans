# frozen_string_literal: true

# SPDX-License-Identifier: CC-BY-NC-SA-3.0
# Adapted from Ruby Koans by Jim Weirich and Joe O'Brien.
# See THIRD_PARTY_NOTICES.md for attribution and license terms.

require ARGV.shift

# Observes object conversion, inspection, and identity.
class AboutObjectsTest < Minitest::Test
  # These ordinary values, including nil and a class, are objects.
  def test_everything_is_an_object
    answers = Exercises::AboutObjects.koans

    assert_equal answers[:integer_object], 1.is_a?(Object)
    assert_equal answers[:float_object], 1.5.is_a?(Object)
    assert_equal answers[:string_object], 'string'.is_a?(Object)
    assert_equal answers[:nil_object], nil.is_a?(Object)
    assert_equal answers[:class_object], Object.is_a?(Object)
  end

  # String conversion can produce an empty string.
  def test_objects_can_be_converted_to_strings
    answers = Exercises::AboutObjects.koans

    assert_equal answers[:integer_string], 123.to_s
    assert_equal answers[:nil_string], nil.to_s
  end

  # Inspection provides a diagnostic representation.
  def test_objects_can_be_inspected
    answers = Exercises::AboutObjects.koans

    assert_equal answers[:integer_inspect], 123.inspect
    assert_equal answers[:nil_inspect], nil.inspect
  end

  # An object identifier is an integer.
  def test_every_object_has_an_id
    obj = Object.new
    answers = Exercises::AboutObjects.koans

    assert_equal answers[:id_type], obj.object_id.class
  end

  # Two live objects have distinct identifiers.
  def test_every_object_has_different_id
    obj = Object.new
    another_obj = Object.new
    answers = Exercises::AboutObjects.koans

    assert_equal answers[:distinct_ids], obj.object_id != another_obj.object_id # rubocop:disable Lint/IdentityComparison
  end

  # Observe the MRI representation of these small integers.
  def test_small_integers_have_fixed_ids
    answers = Exercises::AboutObjects.koans

    assert_equal answers[:zero_id], 0.object_id
    assert_equal answers[:one_id], 1.object_id
    assert_equal answers[:two_id], 2.object_id
    assert_equal answers[:hundred_id], 100.object_id
  end

  # Cloning a plain object creates a different object with a different ID.
  def test_clone_creates_a_different_object
    obj = Object.new
    copy = obj.clone
    answers = Exercises::AboutObjects.koans

    assert_equal answers[:clone_unequal], obj != copy
    assert_equal answers[:clone_distinct_id], obj.object_id != copy.object_id # rubocop:disable Lint/IdentityComparison
  end
end
