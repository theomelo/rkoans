# The method’s contract

Fix `format_order(name, quantity=1, *extras, unit:, **options, &block)` to return "name:quantity:unit:extra_count:priority" where priority defaults to "normal". If a block is supplied, pass the formatted string to it. Implement `parameters` by exposing the actual method parameter metadata. Keep the declared signature intact.

Use `rkoans check` to investigate one failing check at a time. Hints are optional.

Edit `method_contracts.rb` in this exercise's folder. Checks call
`Exercises::MethodContracts` and its example classes.
