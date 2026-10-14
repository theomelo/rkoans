# Hint

Nil is an object with methods. Compare `nil.nil?`, `nil.to_s`, and `nil.inspect`
in IRB, paying attention to an empty string versus a string spelling `nil`.

Call `nil.some_method_nil_doesnt_know_about` and inspect the exception's class
and message. The error names the missing method. Use a nonempty message fragment
as a string, without regular-expression delimiters.

Adapted from Ruby Koans by Jim Weirich and Joe O'Brien, licensed under
CC BY-NC-SA 3.0. See `THIRD_PARTY_NOTICES.md` for attribution and license terms.
