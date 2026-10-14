# frozen_string_literal: true

# SPDX-License-Identifier: CC-BY-NC-SA-3.0
# Adapted from Ruby Koans by Jim Weirich and Joe O'Brien.
# See THIRD_PARTY_NOTICES.md for attribution and license terms.

module Exercises
  # Predicts nil conversions and missing-method behavior.
  class AboutNil
    # Replace each :fill_me_in with the result described by its example.
    # @return [Hash<Symbol, Boolean | String | Class>]
    def self.koans
      {
        # nil.is_a?(Object)
        nil_object: :fill_me_in,
        # exception class raised by nil.some_method_nil_doesnt_know_about
        missing_method_error: :fill_me_in,
        # a nonempty substring of that exception message
        message_fragment: :fill_me_in,
        # nil.nil?
        nil_predicate: :fill_me_in,
        # nil.to_s
        string_value: :fill_me_in,
        # nil.inspect
        inspected_value: :fill_me_in
      }
    end
  end
end
