# About Blocks

Replace each `:fill_me_in` in `about_blocks.rb` with the predicted result.
Each field identifies its example. Run the checks after edits to investigate the
next prediction. Answers include the Ruby values and exception classes shown by
the examples. Read the setup comments before evaluating an expression.

## Example definitions

These definitions supply the objects and methods used by the prediction examples.
They run in the check class `AboutBlocksTest`.

```ruby
def method_with_block
    result = yield
    result
  end

def method_with_block_arguments
    yield("Jim")
  end

def many_yields
    yield(:peanut)
    yield(:butter)
    yield(:and)
    yield(:jelly)
  end

def yield_tester
    if block_given?
      yield
    else
      :no_block
    end
  end

def method_with_explicit_block(&block)
    block.call(10)
  end
```

Adapted from Ruby Koans by Jim Weirich and Joe O'Brien, licensed under
CC BY-NC-SA 3.0. See `THIRD_PARTY_NOTICES.md` for attribution and license terms.
