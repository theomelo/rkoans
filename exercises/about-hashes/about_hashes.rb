# frozen_string_literal: true

# SPDX-License-Identifier: CC-BY-NC-SA-3.0
# Adapted from Ruby Koans by Jim Weirich and Joe O'Brien.
# See THIRD_PARTY_NOTICES.md for attribution and license terms.

module Exercises
  # Predictions for hashes examples.
  class AboutHashes
    # Replace each :fill_me_in with the result of the described expression.
    # @return [Hash<Symbol, Object>]
    # This method is an answer table, not a sequence of operations.
    def self.koans # rubocop:disable Metrics/MethodLength
      {
        # Creating hashes.
        # empty_hash = Hash.new
        # assert_equal __, empty_hash.class
        # assert_equal(__, empty_hash)
        # assert_equal __, empty_hash.size
        # Predict: empty_hash.class
        creating_hashes_one: :fill_me_in,
        # Predict: empty_hash
        creating_hashes_two: :fill_me_in,
        # Predict: empty_hash.size
        creating_hashes_three: :fill_me_in,
        # Hash literals.
        # hash = { :one => "uno", :two => "dos" }
        # assert_equal __, hash.size
        # Predict: hash.size
        hash_literals_one: :fill_me_in,
        # Accessing hashes.
        # hash = { :one => "uno", :two => "dos" }
        # assert_equal __, hash[:one]
        # assert_equal __, hash[:two]
        # assert_equal __, hash[:doesnt_exist]
        # Predict: hash[:one]
        accessing_hashes_one: :fill_me_in,
        # Predict: hash[:two]
        accessing_hashes_two: :fill_me_in,
        # Predict: hash[:doesnt_exist]
        accessing_hashes_three: :fill_me_in,
        # Accessing hashes with fetch.
        # hash = { :one => "uno" }
        # assert_equal __, hash.fetch(:one)
        # assert_raise(___) do
        # hash.fetch(:doesnt_exist)
        # end
        # Predict: hash.fetch(:one)
        accessing_hashes_with_fetch_one: :fill_me_in,
        # Predict: exception class from: hash.fetch(:doesnt_exist)
        accessing_hashes_with_fetch_two: :fill_me_in,
        # Changing hashes.
        # hash = { :one => "uno", :two => "dos" }
        # hash[:one] = "eins"
        # assert_equal __, hash
        # Predict: hash
        changing_hashes_one: :fill_me_in,
        # Hash is unordered.
        # hash1 = { :one => "uno", :two => "dos" }
        # hash2 = { :two => "dos", :one => "uno" }
        # assert_equal __, hash1 == hash2
        # Predict: hash1 == hash2
        hash_is_unordered_one: :fill_me_in,
        # Hash keys.
        # hash = { :one => "uno", :two => "dos" }
        # assert_equal __, hash.keys.size
        # assert_equal __, hash.keys.include?(:one)
        # assert_equal __, hash.keys.include?(:two)
        # assert_equal __, hash.keys.class
        # Predict: hash.keys.size
        hash_keys_one: :fill_me_in,
        # Predict: hash.keys.include?(:one)
        hash_keys_two: :fill_me_in,
        # Predict: hash.keys.include?(:two)
        hash_keys_three: :fill_me_in,
        # Predict: hash.keys.class
        hash_keys_four: :fill_me_in,
        # Hash values.
        # hash = { :one => "uno", :two => "dos" }
        # assert_equal __, hash.values.size
        # assert_equal __, hash.values.include?("uno")
        # assert_equal __, hash.values.include?("dos")
        # assert_equal __, hash.values.class
        # Predict: hash.values.size
        hash_values_one: :fill_me_in,
        # Predict: hash.values.include?("uno")
        hash_values_two: :fill_me_in,
        # Predict: hash.values.include?("dos")
        hash_values_three: :fill_me_in,
        # Predict: hash.values.class
        hash_values_four: :fill_me_in,
        # Combining hashes.
        # hash = { "jim" => 53, "amy" => 20, "dan" => 23 }
        # new_hash = hash.merge({ "jim" => 54, "jenny" => 26 })
        # assert_equal __, hash != new_hash
        # expected = { "jim" => 54, "amy" => 20, "dan" => 23, "jenny" => 26 }
        # assert_equal __, expected == new_hash
        # Predict: hash != new_hash
        combining_hashes_one: :fill_me_in,
        # Predict: expected == new_hash
        combining_hashes_two: :fill_me_in,
        # Default value.
        # hash1 = Hash.new
        # hash1[:one] = 1
        # assert_equal __, hash1[:one]
        # assert_equal __, hash1[:two]
        # hash2 = Hash.new("dos")
        # hash2[:one] = 1
        # assert_equal __, hash2[:one]
        # assert_equal __, hash2[:two]
        # Predict: hash1[:one]
        default_value_one: :fill_me_in,
        # Predict: hash1[:two]
        default_value_two: :fill_me_in,
        # Predict: hash2[:one]
        default_value_three: :fill_me_in,
        # Predict: hash2[:two]
        default_value_four: :fill_me_in,
        # Default value is the same object.
        # hash = Hash.new([])
        # hash[:one] << "uno"
        # hash[:two] << "dos"
        # assert_equal __, hash[:one]
        # assert_equal __, hash[:two]
        # assert_equal __, hash[:three]
        # assert_equal __, hash[:one].equal?(hash[:two])
        # Predict: hash[:one]
        default_value_is_the_same_object_one: :fill_me_in,
        # Predict: hash[:two]
        default_value_is_the_same_object_two: :fill_me_in,
        # Predict: hash[:three]
        default_value_is_the_same_object_three: :fill_me_in,
        # Predict: hash[:one].equal?(hash[:two])
        default_value_is_the_same_object_four: :fill_me_in,
        # Default value with block.
        # hash = Hash.new {|hash, key| hash[key] = [] }
        # hash[:one] << "uno"
        # hash[:two] << "dos"
        # assert_equal __, hash[:one]
        # assert_equal __, hash[:two]
        # assert_equal __, hash[:three]
        # Predict: hash[:one]
        default_value_with_block_one: :fill_me_in,
        # Predict: hash[:two]
        default_value_with_block_two: :fill_me_in,
        # Predict: hash[:three]
        default_value_with_block_three: :fill_me_in,
        # Default value attribute.
        # hash = Hash.new
        # assert_equal __, hash[:some_key]
        # hash.default = 'peanut'
        # assert_equal __, hash[:some_key]
        # Predict: hash[:some_key]
        default_value_attribute_one: :fill_me_in,
        # Predict: hash[:some_key]
        default_value_attribute_two: :fill_me_in
      }
    end
  end
end
