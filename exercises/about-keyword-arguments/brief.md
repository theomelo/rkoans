# About Keyword Arguments

Replace each `:fill_me_in` in `about_keyword_arguments.rb` with the predicted result.
Each field identifies its example. Run the checks after edits to investigate the
next prediction. Answers include the Ruby values and exception classes shown by
the examples. Read the setup comments before evaluating an expression.

## Example definitions

These definitions supply the objects and methods used by the prediction examples.
They run in the check class `AboutKeywordArgumentsTest`.

```ruby
def method_with_keyword_arguments(one: 1, two: 'two')
    [one, two]
  end

def method_with_keyword_arguments_with_mandatory_argument(one, two: 2, three: 3)
    [one, two, three]
  end

def method_with_mandatory_keyword_arguments(one:, two: 'two')
    [one, two]
  end
```

Adapted from Ruby Koans by Jim Weirich and Joe O'Brien, licensed under
CC BY-NC-SA 3.0. See `THIRD_PARTY_NOTICES.md` for attribution and license terms.
