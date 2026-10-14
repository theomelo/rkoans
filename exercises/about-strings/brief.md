# Strings: quotes, changes, and identity

Replace each `nil` in `koans` with the result predicted by the example above it.
Use strings for text, integers for lengths and counts, `true` or `false` for
comparisons, and arrays of strings for split results. Examples are comments so
you can read and experiment with them without changing the checks.

Work through quoting and multiline text, then concatenation and mutation, and
finally escapes, interpolation, slicing, splitting, joining, and object identity.
Both kinds of quotes make strings, but they handle escapes and interpolation
differently. Compare `+`, `+=`, and `<<`: which operations change an existing
string, and which give the variable another string?

The checks use mutable string literals to make those experiments explicit.
String equality and object identity are different questions. Character literals
such as `?a` are strings on the Ruby version used here.

Save a group of predictions at a time and compare Expected (your prediction)
with Actual (Ruby's result).

Adapted from **Ruby Koans: About Strings** by Jim Weirich and Joe O'Brien.
Licensed under [CC BY-NC-SA 3.0](https://creativecommons.org/licenses/by-nc-sa/3.0/).
