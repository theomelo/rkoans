# About Message Passing

Replace each `:fill_me_in` in `about_message_passing.rb` with the predicted result.
Each field identifies its example. Run the checks after edits to investigate the
next prediction. Answers include the Ruby values and exception classes shown by
the examples. Read the setup comments before evaluating an expression.

## Example definitions

These definitions supply the objects and methods used by the prediction examples.
They run in the check class `AboutMessagePassingTest`.

```ruby
class MessageCatcher
    def caught?
      true
    end
  end

class MessageCatcher
    def add_a_payload(*args)
      args
    end
  end

class TypicalObject
  end

class AllMessageCatcher
    def method_missing(method_name, *args, &block)
      "Someone called #{method_name} with <#{args.join(", ")}>"
    end
  end

class WellBehavedFooCatcher
    def method_missing(method_name, *args, &block)
      if method_name.to_s[0,3] == "foo"
        "Foo to you too"
      else
        super(method_name, *args, &block)
      end
    end
  end

class WellBehavedFooCatcher
    private

    def respond_to_missing?(method_name, include_private = false)
      if method_name.to_s[0,3] == "foo"
        true
      else
        super(method_name, include_private)
      end
    end
  end
```

Adapted from Ruby Koans by Jim Weirich and Joe O'Brien, licensed under
CC BY-NC-SA 3.0. See `THIRD_PARTY_NOTICES.md` for attribution and license terms.
