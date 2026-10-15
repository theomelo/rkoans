# The lost keyword

Fix `forward` to preserve positional arguments, keyword arguments, and the block when calling `target`. target takes a payload, suffix: defaulting to "?", and returns the yielded payload string plus the suffix. A positional hash is still a positional payload.

Use `rkoans check` to investigate one failing check at a time. Hints are optional.

Edit `keyword_forwarding.rb` in this exercise's folder. Checks call
`Exercises::KeywordForwarding` and its example classes.
