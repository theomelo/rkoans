# About Methods

Replace each `:fill_me_in` in `about_methods.rb` with the predicted result.
Each field identifies its example. Run the checks after edits to investigate the
next prediction. Answers include the Ruby values and exception classes shown by
the examples. Read the setup comments before evaluating an expression.

## Example definitions

These definitions supply the objects and methods used by the prediction examples.
They run in the check class `AboutMethodsTest`.

```ruby
class Dog
    def name
      "Fido"
    end

    private

    def tail
      "tail"
    end
  end

def method_with_defaults(a, b=:default_value)
    [a, b]
  end

def method_with_var_args(*args)
    args
  end

def method_with_explicit_return
    :a_non_return_value
    return :return_value
    :another_non_return_value
  end

def method_without_explicit_return
    :a_non_return_value
    :return_value
  end

def my_method_in_the_same_class(a, b)
    a * b
  end

def my_private_method
    "a secret"
  end
```

Adapted from Ruby Koans by Jim Weirich and Joe O'Brien, licensed under
CC BY-NC-SA 3.0. See `THIRD_PARTY_NOTICES.md` for attribution and license terms.
