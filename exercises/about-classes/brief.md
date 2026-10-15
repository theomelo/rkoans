# About Classes

Replace each `:fill_me_in` in `about_classes.rb` with the predicted result.
Each field identifies its example. Run the checks after edits to investigate the
next prediction. Answers include the Ruby values and exception classes shown by
the examples. Read the setup comments before evaluating an expression.

## Example definitions

These definitions supply the objects and methods used by the prediction examples.
They run in the check class `AboutClassesTest`.

```ruby
class Dog
  end

class Dog2
    def set_name(a_name)
      @name = a_name
    end
  end

class Dog3
    def set_name(a_name)
      @name = a_name
    end
    def name
      @name
    end
  end

class Dog4
    attr_reader :name

    def set_name(a_name)
      @name = a_name
    end
  end

class Dog5
    attr_accessor :name
  end

class Dog6
    attr_reader :name
    def initialize(initial_name)
      @name = initial_name
    end
  end

class Dog7
    attr_reader :name

    def initialize(initial_name)
      @name = initial_name
    end

    def get_self
      self
    end

    def to_s
      @name
    end

    def inspect
      "<Dog named '#{name}'>"
    end
  end
```

Adapted from Ruby Koans by Jim Weirich and Joe O'Brien, licensed under
CC BY-NC-SA 3.0. See `THIRD_PARTY_NOTICES.md` for attribution and license terms.
