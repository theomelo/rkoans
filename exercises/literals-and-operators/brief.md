# Truthy zero, tricky operators

Fill `predictions` for these expressions: `!!0`, `5 / 2`, `5 / 2.0`, `1 + 2 * 3`, `!nil`, `%w[ruby rails]`, and `(1..3).to_a`. The keys are zero_truthy, integer_division, float_division, precedence, not_nil, words, range. Implement `default_for_nil(value)` to substitute "missing" only for nil, preserving false and zero.

Use `rkoans check` to investigate one failing check at a time. Hints are optional.

Edit `literals_and_operators.rb` in this exercise's folder. Checks call
`Exercises::LiteralsAndOperators` and its example classes.

Use these expressions for the prediction fields, in order:

```ruby
0 ? true : false
5 / 2
5.0 / 2
1 + 2 * 3
!nil
%w[ruby rails]
(1..3).to_a
```
