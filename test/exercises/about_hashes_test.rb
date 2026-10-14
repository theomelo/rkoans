# frozen_string_literal: true

# Constructor and shared-default examples are deliberate observations.
# rubocop:disable Lint/SharedMutableDefault, Style/EmptyLiteral

# SPDX-License-Identifier: CC-BY-NC-SA-3.0
# Adapted from Ruby Koans by Jim Weirich and Joe O'Brien.
# See THIRD_PARTY_NOTICES.md for attribution and license terms.

require ARGV.shift
class AboutHashesTest < Minitest::Test
  # Checks creating hashes.
  def test_creating_hashes
    empty_hash = Hash.new

    assert_equal Exercises::AboutHashes.koans.fetch(:creating_hashes_one), empty_hash.class
    assert_equal Exercises::AboutHashes.koans.fetch(:creating_hashes_two), empty_hash
    assert_equal Exercises::AboutHashes.koans.fetch(:creating_hashes_three), empty_hash.size
  end

  # Checks hash literals.
  def test_hash_literals
    hash = { one: 'uno', two: 'dos' }

    assert_equal Exercises::AboutHashes.koans.fetch(:hash_literals_one), hash.size
  end

  # Checks accessing hashes.
  def test_accessing_hashes
    hash = { one: 'uno', two: 'dos' }

    assert_equal Exercises::AboutHashes.koans.fetch(:accessing_hashes_one), hash[:one]
    assert_equal Exercises::AboutHashes.koans.fetch(:accessing_hashes_two), hash[:two]
    assert_equal Exercises::AboutHashes.koans.fetch(:accessing_hashes_three), hash[:doesnt_exist]
  end

  # Checks accessing hashes with fetch.
  def test_accessing_hashes_with_fetch
    hash = { one: 'uno' }

    assert_equal Exercises::AboutHashes.koans.fetch(:accessing_hashes_with_fetch_one), hash.fetch(:one)
    assert_predicted_error(:accessing_hashes_with_fetch_two, ::KeyError) do
      hash.fetch(:doesnt_exist)
    end

    # THINK ABOUT IT:
    #
    # Why might you want to use #fetch instead of #[] when accessing hash keys?
  end

  # Checks changing hashes.
  def test_changing_hashes
    hash = { one: 'uno', two: 'dos' }
    hash[:one] = 'eins'

    assert_equal Exercises::AboutHashes.koans.fetch(:changing_hashes_one), hash
  end

  # Checks hash is unordered.
  def test_hash_is_unordered
    hash1 = { one: 'uno', two: 'dos' }
    hash2 = { two: 'dos', one: 'uno' }

    assert_equal Exercises::AboutHashes.koans.fetch(:hash_is_unordered_one), (hash1 == hash2)
  end

  # Checks hash keys.
  def test_hash_keys
    hash = { one: 'uno', two: 'dos' }

    assert_equal Exercises::AboutHashes.koans.fetch(:hash_keys_one), hash.keys.size
    assert_equal Exercises::AboutHashes.koans.fetch(:hash_keys_two), hash.keys.include?(:one)
    assert_equal Exercises::AboutHashes.koans.fetch(:hash_keys_three), hash.keys.include?(:two)
    assert_equal Exercises::AboutHashes.koans.fetch(:hash_keys_four), hash.keys.class
  end

  # Checks hash values.
  def test_hash_values
    hash = { one: 'uno', two: 'dos' }

    assert_equal Exercises::AboutHashes.koans.fetch(:hash_values_one), hash.values.size
    assert_equal Exercises::AboutHashes.koans.fetch(:hash_values_two), hash.values.include?('uno')
    assert_equal Exercises::AboutHashes.koans.fetch(:hash_values_three), hash.values.include?('dos')
    assert_equal Exercises::AboutHashes.koans.fetch(:hash_values_four), hash.values.class
  end

  # Checks combining hashes.
  def test_combining_hashes
    hash = { 'jim' => 53, 'amy' => 20, 'dan' => 23 }
    new_hash = hash.merge({ 'jim' => 54, 'jenny' => 26 })

    assert_equal Exercises::AboutHashes.koans.fetch(:combining_hashes_one), (hash != new_hash)

    expected = { 'jim' => 54, 'amy' => 20, 'dan' => 23, 'jenny' => 26 }

    assert_equal Exercises::AboutHashes.koans.fetch(:combining_hashes_two), (expected == new_hash)
  end

  # Checks default value.
  def test_default_value
    hash1 = Hash.new
    hash1[:one] = 1

    assert_equal Exercises::AboutHashes.koans.fetch(:default_value_one), hash1[:one]
    assert_equal Exercises::AboutHashes.koans.fetch(:default_value_two), hash1[:two]

    hash2 = Hash.new('dos')
    hash2[:one] = 1

    assert_equal Exercises::AboutHashes.koans.fetch(:default_value_three), hash2[:one]
    assert_equal Exercises::AboutHashes.koans.fetch(:default_value_four), hash2[:two]
  end

  # Checks default value is the same object.
  def test_default_value_is_the_same_object
    hash = Hash.new([])

    hash[:one] << 'uno'
    hash[:two] << 'dos'

    assert_equal Exercises::AboutHashes.koans.fetch(:default_value_is_the_same_object_one), hash[:one]
    assert_equal Exercises::AboutHashes.koans.fetch(:default_value_is_the_same_object_two), hash[:two]
    assert_equal Exercises::AboutHashes.koans.fetch(:default_value_is_the_same_object_three), hash[:three]

    assert_equal Exercises::AboutHashes.koans.fetch(:default_value_is_the_same_object_four),
                 hash[:one].equal?(hash[:two])
  end

  # Checks default value with block.
  def test_default_value_with_block
    hash = Hash.new { |hash, key| hash[key] = [] }

    hash[:one] << 'uno'
    hash[:two] << 'dos'

    assert_equal Exercises::AboutHashes.koans.fetch(:default_value_with_block_one), hash[:one]
    assert_equal Exercises::AboutHashes.koans.fetch(:default_value_with_block_two), hash[:two]
    assert_equal Exercises::AboutHashes.koans.fetch(:default_value_with_block_three), hash[:three]
  end

  # Checks default value attribute.
  def test_default_value_attribute
    hash = Hash.new

    assert_equal Exercises::AboutHashes.koans.fetch(:default_value_attribute_one), hash[:some_key]

    hash.default = 'peanut'

    assert_equal Exercises::AboutHashes.koans.fetch(:default_value_attribute_two), hash[:some_key]
  end

  # Checks the predicted exception class while returning the captured error.
  # @param key [Symbol] answer field
  # @param klass [Class<Exception>] exception raised by the example
  # @return [Exception]
  def assert_predicted_error(key, ...)
    error = assert_raises(...)
    assert_equal Exercises::AboutHashes.koans.fetch(key), error.class
    error
  end
end

# rubocop:enable Lint/SharedMutableDefault, Style/EmptyLiteral
