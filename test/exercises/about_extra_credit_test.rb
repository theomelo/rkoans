# frozen_string_literal: true

# SPDX-License-Identifier: CC-BY-NC-SA-3.0
# Adapted from Ruby Koans by Jim Weirich and Joe O'Brien.
# See THIRD_PARTY_NOTICES.md for attribution and license terms.

require ARGV.shift

class AboutExtraCreditTest < Minitest::Test
  # Entry requires 300 in one turn; after entry, smaller turns count too.
  def test_entry_threshold_and_later_banking
    player = Exercises::AboutExtraCredit::Player.new('Ruby')

    assert_equal 0, player.bank(250)
    assert_equal 300, player.bank(300)
    assert_equal 350, player.bank(50)
  end

  # A zero-scoring roll forfeits this turn, but leaves earlier banked points intact.
  def test_bust_discards_the_entire_turn
    game = Exercises::AboutExtraCredit::Game.new(%w[Ruby Ada])

    assert_equal 350, game.play_turn([[1, 5, 2, 3, 4], [2, 2, 2]])
    assert_equal 0, game.play_turn([[2, 3, 4, 6, 2]])
    assert_equal 350, game.play_turn([[1, 5, 2, 3, 4], [2, 3, 4]])
  end

  # All scoring dice allow five fresh dice; otherwise only non-scoring dice reroll.
  def test_hot_dice_and_roll_validation
    game = Exercises::AboutExtraCredit::Game.new(%w[Ruby Ada])

    assert_equal 2400, game.play_turn([[1, 1, 1, 1, 1], [1, 1, 1, 1, 1]])
    assert_raises(ArgumentError) { game.play_turn([[1, 5, 2, 3, 4], [1, 1, 1, 1, 1]]) }
    assert_raises(ArgumentError) { game.play_turn([[0, 1, 2, 3, 4]]) }
    assert_raises(ArgumentError) { game.play_turn([[1.0, 1, 2, 3, 4]]) }
    assert_raises(ArgumentError) { game.play_turn([]) }
    assert_raises(ArgumentError) { game.play_turn([[2, 3, 4, 6, 2], [1, 1, 1, 1, 1]]) }
    assert_equal 1, game.current
    assert_equal [2400, 0], game.players.map(&:score)
  end

  # A leader starts one final round, even if a later player overtakes the leader.
  def test_every_other_player_gets_one_final_turn
    game = Exercises::AboutExtraCredit::Game.new(%w[Ruby Ada Matz])
    all_ones = [1, 1, 1, 1, 1]

    assert_equal 3600, game.play_turn([all_ones, all_ones, all_ones])
    refute_predicate game, :finished?
    assert_nil game.winner
    assert_equal 4800, game.play_turn([all_ones, all_ones, all_ones, all_ones])
    refute_predicate game, :finished?
    assert_equal 0, game.play_turn([[2, 3, 4, 6, 2]])
    assert_predicate game, :finished?
    assert_equal 'Ada', game.winner.name
    assert_raises(RuntimeError) { game.play_turn([all_ones]) }
    assert_raises(ArgumentError) { Exercises::AboutExtraCredit::Game.new(['solo']) }
  end

  # Exactly 3000 starts the final round; the remaining turns wrap around the order.
  def test_final_round_starts_at_3000_and_wraps_turn_order
    game = Exercises::AboutExtraCredit::Game.new(%w[Ruby Ada Matz])
    all_ones = [1, 1, 1, 1, 1]
    threshold = [all_ones, all_ones, [6, 6, 6, 2, 3]]
    game.play_turn([[2, 3, 4, 6, 2]])

    assert_equal 3000, game.play_turn(threshold)
    refute_predicate game, :finished?
    assert_equal 0, game.play_turn([[2, 3, 4, 6, 2]])
    refute_predicate game, :finished?
    assert_equal 3000, game.play_turn(threshold)
    assert_predicate game, :finished?
    assert_equal 'Ruby', game.winner.name
  end
end
