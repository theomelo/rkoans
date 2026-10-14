# frozen_string_literal: true

# SPDX-License-Identifier: CC-BY-NC-SA-3.0
# Adapted from Ruby Koans by Jim Weirich and Joe O'Brien.
# See THIRD_PARTY_NOTICES.md for attribution and license terms.

module Exercises
  # Predicts how array values are assigned to one or several variables.
  class AboutArrayAssignment
    # Replace each :fill_me_in with the assigned value shown in its example.
    # @return [Hash<Symbol, String | Array<String> | nil>]
    def self.koans
      {
        # names = ['John', 'Smith']; names
        names: :fill_me_in,
        # first_name, last_name = ['John', 'Smith']; first_name
        first_name: :fill_me_in,
        # first_name, last_name = ['John', 'Smith']; last_name
        last_name: :fill_me_in,
        # first_name, last_name = ['John', 'Smith', 'III']; first_name
        extra_first: :fill_me_in,
        # first_name, last_name = ['John', 'Smith', 'III']; last_name
        extra_last: :fill_me_in,
        # first_name, *last_name = ['John', 'Smith', 'III']; first_name
        splat_first: :fill_me_in,
        # first_name, *last_name = ['John', 'Smith', 'III']; last_name
        splat_last: :fill_me_in,
        # first_name, last_name = ['Cher']; first_name
        short_first: :fill_me_in,
        # first_name, last_name = ['Cher']; last_name
        short_last: :fill_me_in,
        # first_name, last_name = [['Willie', 'Rae'], 'Johnson']; first_name
        nested_first: :fill_me_in,
        # first_name, last_name = [['Willie', 'Rae'], 'Johnson']; last_name
        nested_last: :fill_me_in,
        # first_name, = ['John', 'Smith']; first_name
        single_first: :fill_me_in,
        # first_name = 'Roy'; last_name = 'Rob'; first_name, last_name = last_name, first_name; first_name
        swapped_first: :fill_me_in,
        # first_name = 'Roy'; last_name = 'Rob'; first_name, last_name = last_name, first_name; last_name
        swapped_last: :fill_me_in
      }
    end
  end
end
