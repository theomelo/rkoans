# The newline loophole

Implement `parse(text)` for an entire string of lowercase name, colon, and decimal digits. Return {name: String,id: Integer}, or nil for any other input. Reject trailing newlines and multiple lines. Implement `probe(text)` so /ruby/ matching returns a boolean while preserving a previously established match for "old" in its own scope.

Use `rkoans check regexp-captures` to investigate one failing check at a time. Hints are optional.

Edit `regexp_captures.rb` in this exercise's folder. Checks call
`Exercises::RegexpCaptures` and its example classes.
