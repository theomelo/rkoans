# Three Rows, One Surprise

Fix `Exercises::SharedRows.rows(count)` in `shared_rows.rb` so it returns the
requested number of empty, mutable arrays. Changing one row must leave the
others untouched. Return `[]` for zero rows and fresh rows on each call.

The starter supplies one array as the initial value to `Array.new`. Explore why
appending to one row changes the others, then change how the rows are created.
