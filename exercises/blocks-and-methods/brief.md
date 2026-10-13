# Who calls the block?

The expression `3.times.map { |i| i + 1 }` returns three values.
Fill `koans[:sequence]`. Implement `apply(value)` to call the supplied block
once and return its result. For `apply(5) { |n| n * 3 }`, return 15.
Calling without a block should raise `LocalJumpError`.

Save your file to rerun the checks automatically.
