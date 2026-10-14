# Symbols: names, values, and identity

Replace each `:fill_me_in` prediction with the result of its commented example.
Use `true` or `false` for comparisons, symbols or strings for converted values,
and an exception class for the unsupported concatenation example.

Compare the value and identity of two symbols with the same name. Convert a
string to a symbol, try quoted names containing spaces, and observe interpolation.
A symbol is a different type from a string, even when they have the same spelling.

The checks define a constant named `RUBY_CONSTANT` and a method named
`test_method_names_become_symbols`. Predict whether their names occur in
`Symbol.all_symbols`. Compare strings when searching: creating a new symbol for
the expected name would change the table being observed.

For `concatenation_error`, predict the class of the exception raised by
`:cats + :dogs`, rather than an exception instance. Save a group of predictions
at a time and compare Expected (your prediction) with Actual (Ruby's result).

Adapted from **Ruby Koans: About Symbols** by Jim Weirich and Joe O'Brien.
Licensed under [CC BY-NC-SA 3.0](https://creativecommons.org/licenses/by-nc-sa/3.0/).
