# Hint: a symbol is a name, not a string

Identical symbol names refer to the same symbol object. `to_sym` converts a
string into a symbol, while interpolation uses `to_s` to insert text.

Use `respond_to?` to explore a proposed string operation. If an operation is
unsupported, Ruby's failure names the exception class; compare that class with
your prediction. Constant and method names already declared by the checks are
present in the symbol table.

Adapted from **Ruby Koans: About Symbols** by Jim Weirich and Joe O'Brien.
Licensed under [CC BY-NC-SA 3.0](https://creativecommons.org/licenses/by-nc-sa/3.0/).
