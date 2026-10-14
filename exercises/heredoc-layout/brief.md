# Whitespace is data

A heredoc makes a multiline string between a starting delimiter and its closing
line. Fix `render(name)` to return exactly `"Hello Ada\n  Ruby\n"` for `"Ada"`.
Other names must interpolate too. Remove common source indentation while keeping
the two spaces before `Ruby` and the final newline.

Then fix `literal` to return the literal characters `Hello #{name}` followed by
a newline. It must preserve the marker instead of inserting a variable's value.
Keep both heredoc examples so you can compare indentation and quoting.

Compare `<<-TEXT` with `<<~TEXT`, and an unquoted delimiter with a single-quoted
one. An indented closing delimiter and stripped content indentation are different
features. Save to rerun the checks automatically.
