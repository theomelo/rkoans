# Ensure the trail survives

Implement `trace(fail:)`: append "work"; if fail, raise and rescue a StandardError and append "rescue"; otherwise append "else". In both cases append "ensure" in an ensure clause. Return the ordered trail. Implement `reraises` so a rescued ArgumentError is re-raised with its original message.

Use `rkoans check` to investigate one failing check at a time. Hints are optional.

Edit `exception_flow.rb` in this exercise's folder. Checks call
`Exercises::ExceptionFlow` and its example classes.
