# No names, still parameters

Implement `pair_sums` using the block’s input pairs; for [[2,3],[4,5]], return [5,9]. Explore `_1` and `_2` as alternatives to named block parameters. Fill `predictions` for whether these parse: `[1].map { |n| _1 }` and `[[1,2]].map { _1 + _2 }`. Return explicit_and_numbered and numbered_pair booleans.

Use `rkoans check numbered-parameters` to investigate one failing check at a time. Hints are optional.

Edit `numbered_parameters.rb` in this exercise's folder. Checks call
`Exercises::NumberedParameters` and its example classes.

For the syntax predictions, compare these blocks:

```ruby
# explicit_and_numbered: can explicit names and numbered parameters be mixed?
# [[2, 3]].map { |left, right| _1 + _2 }

# numbered_pair: does this block receive both components of each pair?
[[2, 3]].map { _1 + _2 }
```
