# A local voice

Speaker#say normally returns "plain". A refinement should change it to "local" only in Exercises::RefinementScope::Local.call, which activates the refinement lexically. Exercises::RefinementScope.outside must still return "plain". Fix activation without globally reopening Speaker.

Use `rkoans check` to investigate one failing check at a time. Hints are optional.

Edit `refinement_scope.rb` in this exercise's folder. Checks call
`Exercises::RefinementScope` and its example classes.
