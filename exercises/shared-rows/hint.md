# Hint

An array holds references to objects. Passing a second argument to `Array.new`
places that same object in every position; it does not copy it.

The block form runs once per position. What could the block return so each row
has its own mutable contents?
