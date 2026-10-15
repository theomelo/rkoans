# Dice Project

Complete `Exercises::AboutDiceProject::DiceSet#roll(count)` in `about_dice_project.rb`.
Replace `values` with exactly `count` integers from 1 through 6. Values must stay
stable when read and only change when rolled. Zero dice produces an empty array.
Use the random source supplied to the constructor and call `rand(1..6)` once
per die. Normal use defaults to `Random.new`; checks supply a seeded source.

Two genuinely random rolls can be equal. The checks therefore replay a known
random stream instead of requiring successive rolls to differ.

Adapted from Ruby Koans by Jim Weirich and Joe O'Brien, licensed under CC BY-NC-SA 3.0. See `THIRD_PARTY_NOTICES.md`.
