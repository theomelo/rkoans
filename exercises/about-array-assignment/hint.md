# Hint

One variable normally receives the whole array. Several variables receive its
values in order. A splat collects the remaining values in an array; without it,
extra values are discarded. Missing values become `nil`.

Compare `name = names` with `name, = names`. When swapping variables, Ruby
evaluates the right-hand values before updating either left-hand variable.

Adapted from Ruby Koans by Jim Weirich and Joe O'Brien, licensed under
CC BY-NC-SA 3.0. See `THIRD_PARTY_NOTICES.md` for attribution and license terms.
