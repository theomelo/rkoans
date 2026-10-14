# frozen_string_literal: true

# SPDX-License-Identifier: CC-BY-NC-SA-3.0
# Adapted from Ruby Koans by Jim Weirich and Joe O'Brien.
# See THIRD_PARTY_NOTICES.md for attribution and license terms.

module Exercises
  # Predicts nil conversions and missing-method behavior.
  class AboutNil
    # Returns reference predictions for the nil examples.
    # @return [Hash<Symbol, Boolean | String | Class>]
    def self.koans
      {
        nil_object: true,
        missing_method_error: NoMethodError,
        message_fragment: 'some_method_nil_doesnt_know_about',
        nil_predicate: true,
        string_value: '',
        inspected_value: 'nil'
      }
    end
  end
end
