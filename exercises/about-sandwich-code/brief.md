# Sandwich Code

Complete `file_sandwich(path)` and `find_line2(path)` in `about_sandwich_code.rb`.
The sandwich opens a file, yields it, returns the block's result, and always
closes the file, even when the block raises or exits early. The second search
method must use the sandwich to return the first line containing `e`, or `nil`
when none matches. Keep the line ending when present.

Compare the supplied counting and searching methods: explicit `ensure`, a shared
block helper, and `File.open` with a block all provide resource cleanup. The
original example has four lines: `this`, `is`, `a`, `test`. Checks create real
temporary files, so the lesson works from any working directory.

Adapted from Ruby Koans by Jim Weirich and Joe O'Brien, licensed under CC BY-NC-SA 3.0. See `THIRD_PARTY_NOTICES.md`.
