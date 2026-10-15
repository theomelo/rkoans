# About Constants

Replace each `:fill_me_in` in `about_constants.rb` with the predicted result.
Each field identifies its example. Run the checks after edits to investigate the
next prediction. Answers include the Ruby values and exception classes shown by
the examples. Read the setup comments before evaluating an expression.

## Example definitions

These definitions supply the objects and methods used by the prediction examples.
They run in the check class `AboutConstantsTest`.

```ruby
class Animal
    LEGS = 4
    def legs_in_animal
      LEGS
    end

    class NestedAnimal
      def legs_in_nested_animal
        LEGS
      end
    end
  end

class Reptile < Animal
    def legs_in_reptile
      LEGS
    end
  end

class MyAnimals
    LEGS = 2

    class Bird < Animal
      def legs_in_bird
        LEGS
      end
    end
  end

class MyAnimals::Oyster < Animal
    def legs_in_oyster
      LEGS
    end
  end
```

Adapted from Ruby Koans by Jim Weirich and Joe O'Brien, licensed under
CC BY-NC-SA 3.0. See `THIRD_PARTY_NOTICES.md` for attribution and license terms.
