# Where am I running?

Implement `Exercises::RuntimeContext.context` using the process's actual `ARGV`,
`ENV['RKOANS_GREETING']`, `$PROGRAM_NAME`, `__FILE__`, `__ENCODING__`, and `RUBY_VERSION`.

Return a hash with these keys:

- `arguments`: a copy of the current arguments, without consuming or changing `ARGV`.
- `greeting`: the environment value, or `nil` when that key is absent.
- `program`: the basename of the entry-point file.
- `file`: the basename of the file containing `context`.
- `encoding`: the source encoding's name.
- `ruby`: the running Ruby version.

The checks run this file through a separate entry point, so `program` and `file`
describe different files. Each check controls its own arguments and environment;
you do not need to configure your shell. Changing the returned `arguments` array
must leave `ARGV` unchanged.

Save your file to rerun the checks automatically.
