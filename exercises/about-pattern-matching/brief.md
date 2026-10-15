# About Pattern Matching

Replace each `:fill_me_in` in `about_pattern_matching.rb` with the predicted result.
Each field identifies its example. Run the checks after edits to investigate the
next prediction. Answers include the Ruby values and exception classes shown by
the examples. Read the setup comments before evaluating an expression.

## Example definitions

These definitions supply the objects and methods used by the prediction examples.
They run in the check class `AboutPatternMatchingTest`.

```ruby
class Deconstructible
    def initialize(str)
      @data = str
    end

    def deconstruct
      @data&.split('')
    end
  end

class LetterAccountant
    def initialize(str)
      @data = str
    end

    def deconstruct_keys(keys)
      # we will count number of occurrences of each key in our data
      keys.map { |key| [key, @data.count(key.to_s)] }.to_h
    end
  end

def value_pattern(variable)
    case variable
    in 0
      :match_exact_value
    in 1..10
      :match_in_range
    in Integer
      :match_with_class
    else
      :no_match
    end
  end

def variable_pattern_with_binding(variable)
    case 0
    in variable
      variable
    else
      :no_match
    end
  end

def variable_pattern_with_pin(variable)
    case 0
    in ^variable
      variable
    else
      :no_match
    end
  end

def pattern_with_dropping(variable)
    case variable
    in [_, 2]
      :match
    else
      :no_match
    end
  end

def alternative_pattern(variable)
    case variable
    in 0 | false | nil
      :match
    else
      :no_match
    end
  end

def as_pattern
    a = 'First I was afraid'

    case 'I was petrified'
    in String => a
      a
    else
      :no_match
    end
  end

def array_pattern(deconstructible)
    case deconstructible
    in 'a', *res, 'd'
      res
    else
      :no_match
    end
  end

def hash_pattern(deconstructible_as_hash)
    case deconstructible_as_hash
    in {a: a, b: b}
      [a, b]
    else
      :no_match
    end
  end

def hash_pattern_with_sugar(deconstructible_as_hash)
    case deconstructible_as_hash
    in a:, b:
      [a, b]
    else
      :no_match
    end
  end
```

Adapted from Ruby Koans by Jim Weirich and Joe O'Brien, licensed under
CC BY-NC-SA 3.0. See `THIRD_PARTY_NOTICES.md` for attribution and license terms.
