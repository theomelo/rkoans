# Send it to the right receiver

Mailbox wraps a supplied array. Use Forwardable so push and size delegate to that supplied array, including later changes made directly to it. Do not copy it or delegate to the archive. Return Array#push’s normal result.

Use `rkoans check` to investigate one failing check at a time. Hints are optional.

Edit `delegation.rb` in this exercise's folder. Checks call
`Exercises::Delegation` and its example classes.
