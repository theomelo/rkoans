# Which scope owns this name?

Study this setup, then fill `predictions`: a module Catalog has LABEL="outer"; Catalog::Item has LABEL="item" and Catalog::Item::Nested reads LABEL. A class Base sets @@count=0; Child inherits Base and increments @@count. A local `value` assigned only inside a block does not become available outside that block unless it was already declared. Return lexical_label, shared_class_count, new_block_local_visible. Implement `counter` as a closure over a local integer; two separately created counters must not share state.

Use `rkoans check` to investigate one failing check at a time. Hints are optional.

Edit `constant_scope.rb` in this exercise's folder. Checks call
`Exercises::ConstantScope` and its example classes.
