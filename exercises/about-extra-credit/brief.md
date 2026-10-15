# Extra Credit

The original extra-credit chapter proposes a free-form Greed game. This adaptation
provides a deterministic engine to repair in `about_extra_credit.rb`; a terminal
interface or computer player remains an optional extension.

Fix the three incomplete rules in `Player#bank`, `Game#turn_points`, and
`Game#advance`. Supplied scoring follows the scoring project: triples of ones
are 1000, other triples are 100 times the face, remaining ones are 100 and
fives are 50. Dice count once per roll.

`Game.new(names)` requires at least two players. `play_turn(rolls)` accepts all
rolls for the current player and returns their total score. The first roll uses
five dice; later rolls use only non-scoring dice, or five again when all scored.
Ending the supplied rolls means banking. A zero-point roll ends the turn and
loses its accumulated points, preserving earlier banked totals. A player must
first bank at least 300 in one turn; smaller turns count after entry.

Reaching 3000 starts the final round: every other player gets exactly one more
turn, even if someone overtakes the leader. `finished?` then becomes true and
`winner` returns the highest-scoring Player (first in turn order on a tie).
Reject further turns. Malformed rolls raise `ArgumentError` without advancing
the game. Example: `[[1, 5, 2, 3, 4], [2, 2, 2]]` banks 350 points.

Rolls are inputs so the game can be checked reproducibly. You can connect it to
your DiceSet and a human or automated decision-maker as an optional extension.

Adapted from Ruby Koans by Jim Weirich and Joe O'Brien, licensed under CC BY-NC-SA 3.0. See `THIRD_PARTY_NOTICES.md`.
