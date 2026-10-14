# frozen_string_literal: true

# SPDX-License-Identifier: CC-BY-NC-SA-3.0
# Adapted from Ruby Koans by Jim Weirich and Joe O'Brien.
# See THIRD_PARTY_NOTICES.md for attribution and license terms.

module Exercises
  # Predicts conversion, inspection, and object identity.
  class AboutObjects
    # Replace each :fill_me_in with the result of its example.
    # @return [Hash<Symbol, Boolean | String | Integer | Class>]
    def self.koans
      {
        # 1.is_a?(Object)
        integer_object: :fill_me_in,
        # 1.5.is_a?(Object)
        float_object: :fill_me_in,
        # 'string'.is_a?(Object)
        string_object: :fill_me_in,
        # nil.is_a?(Object)
        nil_object: :fill_me_in,
        # Object.is_a?(Object)
        class_object: :fill_me_in,
        # 123.to_s
        integer_string: :fill_me_in,
        # nil.to_s
        nil_string: :fill_me_in,
        # 123.inspect
        integer_inspect: :fill_me_in,
        # nil.inspect
        nil_inspect: :fill_me_in,
        # obj = Object.new; obj.object_id.class
        id_type: :fill_me_in,
        # obj = Object.new; another_obj = Object.new; obj.object_id != another_obj.object_id
        distinct_ids: :fill_me_in,
        # 0.object_id
        zero_id: :fill_me_in,
        # 1.object_id
        one_id: :fill_me_in,
        # 2.object_id
        two_id: :fill_me_in,
        # 100.object_id
        hundred_id: :fill_me_in,
        # obj = Object.new; copy = obj.clone; obj != copy
        clone_unequal: :fill_me_in,
        # obj = Object.new; copy = obj.clone; obj.object_id != copy.object_id
        clone_distinct_id: :fill_me_in
      }
    end
  end
end
