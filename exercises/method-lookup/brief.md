# A wrapper before the class

Presenter.new.call returns "base". Wrapper#call adds square brackets around super. Fix composition so the wrapper runs before Presenter without replacing the base method. `lookup` should return the names of the first two ancestors: Exercises::MethodLookup::Wrapper, Exercises::MethodLookup::Presenter.

Use `rkoans check` to investigate one failing check at a time. Hints are optional.

Edit `method_lookup.rb` in this exercise's folder. Checks call
`Exercises::MethodLookup` and its example classes.
