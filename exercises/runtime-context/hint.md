# Hint: process inputs and source context

`ARGV` contains command-line arguments; `ENV` exposes environment entries.
Reading a missing environment key returns `nil`.

`__FILE__` identifies the source file containing the expression, while
`$PROGRAM_NAME` identifies the entry point. Use `File.basename` to keep only
their filenames. Think about how to return an array without sharing its mutations.
