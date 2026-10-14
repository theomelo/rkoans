# Hint: indentation and interpolation are separate

`<<~` strips the common leading indentation from the content while preserving
indentation relative to other lines. `<<-` allows an indented closing delimiter
but keeps the content indentation.

Single-quote the starting delimiter to keep `#{name}` as literal text. The
closing delimiter still uses its plain name. Once quoting is fixed, the local
`name` assignment in `literal` is no longer needed.
