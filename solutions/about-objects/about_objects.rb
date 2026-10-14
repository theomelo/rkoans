# frozen_string_literal: true

# SPDX-License-Identifier: CC-BY-NC-SA-3.0
# Adapted from Ruby Koans by Jim Weirich and Joe O'Brien.
# See THIRD_PARTY_NOTICES.md for attribution and license terms.

module Exercises
  # Predicts conversion, inspection, and object identity.
  class AboutObjects
    # Returns reference predictions for the object experiments.
    # @return [Hash<Symbol, Boolean | String | Integer | Class>]
    def self.koans
      {
        integer_object: true,
        float_object: true,
        string_object: true,
        nil_object: true,
        class_object: true,
        integer_string: '123',
        nil_string: '',
        integer_inspect: '123',
        nil_inspect: 'nil',
        id_type: Integer,
        distinct_ids: true,
        zero_id: 1,
        one_id: 3,
        two_id: 5,
        hundred_id: 201,
        clone_unequal: true,
        clone_distinct_id: true
      }
    end
  end
end
