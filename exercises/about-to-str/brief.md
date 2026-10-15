# About To Str

Replace each `:fill_me_in` in `about_to_str.rb` with the predicted result.
Each field identifies its example. Run the checks after edits to investigate the
next prediction. Answers include the Ruby values and exception classes shown by
the examples. Read the setup comments before evaluating an expression.

## Example definitions

These definitions supply the objects and methods used by the prediction examples.
They run in the check class `AboutToStrTest`.

```ruby
class CanNotBeTreatedAsString
    def to_s
      "non-string-like"
    end
  end

class CanBeTreatedAsString
    def to_s
      "string-like"
    end

    def to_str
      to_s
    end
  end

def acts_like_a_string?(string)
    string = string.to_str if string.respond_to?(:to_str)
    string.is_a?(String)
  end
```

Adapted from Ruby Koans by Jim Weirich and Joe O'Brien, licensed under
CC BY-NC-SA 3.0. See `THIRD_PARTY_NOTICES.md` for attribution and license terms.
