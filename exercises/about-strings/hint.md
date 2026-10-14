# Hint: follow the object, not just the variable

`+` creates a string; `+=` reassigns the variable to a concatenated string.
`<<` appends to the existing string, so another variable referring to it sees
the change. For identity, ask whether two names refer to the same object.

Read escape and interpolation examples one character at a time. Multiline text
includes its newline characters; single quotes preserve most backslashes.

Adapted from **Ruby Koans: About Strings** by Jim Weirich and Joe O'Brien.
Licensed under [CC BY-NC-SA 3.0](https://creativecommons.org/licenses/by-nc-sa/3.0/).
