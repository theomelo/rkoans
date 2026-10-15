# About Class Methods

Replace each `:fill_me_in` in `about_class_methods.rb` with the predicted result.
Each field identifies its example. Run the checks after edits to investigate the
next prediction. Answers include the Ruby values and exception classes shown by
the examples. Read the setup comments before evaluating an expression.

## Example definitions

These definitions supply the objects and methods used by the prediction examples.
They run in the check class `AboutClassMethodsTest`.

```ruby
class Dog
  end

class Dog2
    def wag
      :instance_level_wag
    end
  end

class Dog
    attr_accessor :name
  end

class Dog
    def Dog.a_class_method
      :dogs_class_method
    end
  end

class Dog
                                     21
                                   end

class Dog
                                 self
                               end

class Dog
    def self.class_method2
      :another_way_to_write_class_methods
    end
  end

class Dog
    class << self
      def another_class_method
        :still_another_way
      end
    end
  end

def fido.wag
      :fidos_wag
    end

def fido.wag
      :fidos_wag
    end

def Dog2.wag
    :class_level_wag
  end

def Dog.name
    @name
  end
```

Adapted from Ruby Koans by Jim Weirich and Joe O'Brien, licensed under
CC BY-NC-SA 3.0. See `THIRD_PARTY_NOTICES.md` for attribution and license terms.
