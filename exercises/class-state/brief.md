# An inherited counter

Keep independent counts for Parent and Child. Both start at zero; incrementing one must not alter the other. Child.label must compose its label with Parent.label through super, producing "parent-child". Implement `singleton_owner` to identify the singleton class that owns Parent.label.

Use `rkoans check` to investigate one failing check at a time. Hints are optional.

Edit `class_state.rb` in this exercise's folder. Checks call
`Exercises::ClassState` and its example classes.
