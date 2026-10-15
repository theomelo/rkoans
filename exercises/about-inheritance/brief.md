# About Inheritance

Replace each `:fill_me_in` in `about_inheritance.rb` with the predicted result.
Each field identifies its example. Run the checks after edits to investigate the
next prediction. Answers include the Ruby values and exception classes shown by
the examples. Read the setup comments before evaluating an expression.

## Example definitions

These definitions supply the objects and methods used by the prediction examples.
They run in the check class `AboutInheritanceTest`.

```ruby
class Dog
    attr_reader :name

    def initialize(name)
      @name = name
    end

    def bark
      "WOOF"
    end
  end

class Chihuahua < Dog
    def wag
      :happy
    end

    def bark
      "yip"
    end
  end

class BullDog < Dog
    def bark
      super + ", GROWL"
    end
  end

class GreatDane < Dog
    def growl
      super.bark + ", GROWL"
    end
  end
```

Adapted from Ruby Koans by Jim Weirich and Joe O'Brien, licensed under
CC BY-NC-SA 3.0. See `THIRD_PARTY_NOTICES.md` for attribution and license terms.
