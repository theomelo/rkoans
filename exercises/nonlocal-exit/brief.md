# Who does return leave?

Implement `lambda_trace` so return inside the lambda ends only that lambda, and the method still appends "after". Implement `escaped_proc` returning an ordinary proc with a nonlocal return: calling it after the defining method has returned must raise LocalJumpError. Implement `find_even` using catch/throw to stop nested traversal, returning the first even number or nil. `skip_odds` uses next to collect only even values.

Use `rkoans check` to investigate one failing check at a time. Hints are optional.

Edit `nonlocal_exit.rb` in this exercise's folder. Checks call
`Exercises::NonlocalExit` and its example classes.
