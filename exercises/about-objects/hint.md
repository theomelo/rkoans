# Hint

Compare `nil.to_s` with `nil.inspect` in IRB. One is a string conversion; the
other is a representation useful for inspecting a value.

An object keeps its ID while it is alive, and distinct live objects have
distinct IDs. A second variable can point to the same object; `clone` creates
a different object. Inspect IDs for `0`, `1`, `2`, and `100` to find the pattern
used for these small integers on MRI.

Adapted from Ruby Koans by Jim Weirich and Joe O'Brien, licensed under
CC BY-NC-SA 3.0. See `THIRD_PARTY_NOTICES.md` for attribution and license terms.
