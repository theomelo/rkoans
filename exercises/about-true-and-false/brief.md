# True, false, and everything else

An `if` statement chooses a branch based on its condition:

```ruby
if condition
  :true_stuff
else
  :false_stuff
end
```

Fill each answer in `koans` with `:true_stuff` or `:false_stuff`, predicting the
branch for `true`, `false`, `nil`, `1`, `0`, `[]`, `{}`, `"Strings"`, and `""`.
The answer names match these inputs in order. The colon creates a symbol, which
we use here as a branch label.

Pay particular attention to zero and empty collections. Do they behave like
false? Save one prediction at a time and read the failing check's message.

Adapted from **Ruby Koans: About True and False** by Jim Weirich and Joe O'Brien.
Licensed under [CC BY-NC-SA 3.0](https://creativecommons.org/licenses/by-nc-sa/3.0/).
