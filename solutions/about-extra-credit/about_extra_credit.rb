# frozen_string_literal: true

# SPDX-License-Identifier: CC-BY-NC-SA-3.0
# Adapted from Ruby Koans by Jim Weirich and Joe O'Brien.
# See THIRD_PARTY_NOTICES.md for attribution and license terms.

module Exercises
  # A deterministic Greed game engine; callers supply rolls and decide when to bank.
  class AboutExtraCredit
    # Tracks one player and the entry threshold.
    class Player
      attr_reader :name, :score

      # @param name [String] player name
      def initialize(name)
        @name = name
        @score = 0
      end

      # Bank a turn once the player has entered with at least 300 points.
      # @return [Integer] total score
      def bank(points)
        @score += points if @score.positive? || points >= 300
        @score
      end
    end

    # Coordinates turn order, banking, busts and the final round.
    class Game
      attr_reader :players, :current

      # @param names [Array<String>] at least two players, in turn order
      def initialize(names)
        raise ArgumentError, 'at least two players required' if names.size < 2

        @players = names.map { |name| Player.new(name) }
        @current = 0
        @remaining = nil
      end

      # Play the current player's complete turn; ending the rolls banks the points.
      # @param rolls [Array<Array<Integer>>] ordered rolls, with legal remaining-dice counts
      # @return [Integer] that player's total score after this turn
      def play_turn(rolls)
        raise 'game finished' if finished?

        total = players[current].bank(turn_points(rolls))
        advance(total)
        total
      end

      # @return [Boolean] all other players have taken their final turn
      def finished?
        @remaining&.zero? || false
      end

      # @return [Player, nil] highest-scoring player after the final round; first in a tie
      def winner
        players.max_by(&:score) if finished?
      end

      private

      # @return [Integer] accumulated turn points, or zero after a bust
      def turn_points(rolls)
        raise ArgumentError, 'a turn needs at least one roll' if rolls.empty?

        points = 0
        count = 5
        rolls.each_with_index do |roll, index|
          validate_roll(roll, count)
          scored, unused = score_roll(roll)
          if scored.zero?
            raise ArgumentError, 'turn ends on a bust' unless index == rolls.size - 1

            return 0
          end
          points += scored
          count = unused.zero? ? 5 : unused
        end
        points
      end

      # @return [void] reject malformed rolls before changing game state
      def validate_roll(roll, count)
        valid = roll.size == count && roll.all? { |face| face.is_a?(Integer) && (1..6).cover?(face) }
        raise ArgumentError, 'invalid dice count or face' unless valid
      end

      # @return [Array<Integer>] points and the number of non-scoring dice
      def score_roll(roll)
        points = 0
        unused = 0
        roll.tally.each do |face, amount|
          triples, singles = amount.divmod(3)
          points += triples * (face == 1 ? 1000 : face * 100)
          points += singles * { 1 => 100, 5 => 50 }.fetch(face, 0)
          unused += singles unless [1, 5].include?(face)
        end
        [points, unused]
      end

      # Start the final round once, then give each remaining player exactly one turn.
      def advance(total)
        if @remaining
          @remaining -= 1
        elsif total >= 3000
          @remaining = players.size - 1
        end
        @current = (current + 1) % players.size
      end
    end
  end
end
