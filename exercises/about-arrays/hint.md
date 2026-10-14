# Hint

Array indexes start at zero. Negative indexes count backward from the end.

With `array[start, length]`, `length` is a count of elements. Compare a start at
`array.length` with a start beyond it: an empty array and `nil` are different.
For ranges, `..` includes the endpoint and `...` excludes it.

Try `push`, `pop`, `unshift`, and `shift` in IRB. Inspect the array after each
operation as well as the value returned by the operation.

Adapted from Ruby Koans by Jim Weirich and Joe O'Brien, licensed under
CC BY-NC-SA 3.0. See `THIRD_PARTY_NOTICES.md` for attribution and license terms.
