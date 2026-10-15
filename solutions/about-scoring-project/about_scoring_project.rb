# frozen_string_literal: true

# SPDX-License-Identifier: CC-BY-NC-SA-3.0
# Adapted from Ruby Koans by Jim Weirich and Joe O'Brien.
# See THIRD_PARTY_NOTICES.md for attribution and license terms.

module Exercises
  # Scores a single Greed roll of up to five six-sided dice.
  class AboutScoringProject
    # @param dice [Array<Integer>] face values between one and six
    # @return [Integer] points, counting each die only once
    def self.score(dice)
      dice.tally.sum do |face, count|
        triples, singles = count.divmod(3)
        (triples * (face == 1 ? 1000 : face * 100)) + (singles * { 1 => 100, 5 => 50 }.fetch(face, 0))
      end
    end
  end
end
