# frozen_string_literal: true

# SPDX-License-Identifier: CC-BY-NC-SA-3.0
# Adapted from Ruby Koans by Jim Weirich and Joe O'Brien.
# See THIRD_PARTY_NOTICES.md for attribution and license terms.

module Exercises
  # A set of dice with stable values until the next roll.
  class AboutDiceProject
    # Stores the latest roll from an injectable random source.
    class DiceSet
      attr_reader :values

      # @param random [Random] source of uniform six-sided die values
      def initialize(random: Random.new)
        @random = random
        @values = []
      end

      # @param count [Integer] number of dice to roll
      # @return [Array<Integer>] freshly rolled values
      def roll(_count)
        @values = []
      end
    end
  end
end
