# Start with assertions

An assertion checks whether something is true. A passing check stays quiet;
a failing check tells you what to investigate.

Open your `about_asserts.rb` file and replace the five answers in `koans`:

- `truth`: make `assert truth` pass.
- `with_message`: make `assert with_message, "This should be true -- Please fix this"` pass.
- `expected_value`: supply the expected result for `1 + 1`, checked with `assert expected_value == actual_value`.
- `better_expected_value`: supply that same result, checked with `assert_equal expected_value, actual_value`.
- `filled_value`: fill the expectation in `assert_equal filled_value, 1 + 1`.

Start with one answer and save. Compare the failures for `expected_value` and
`better_expected_value`: `assert_equal` reports the expected and actual values,
which makes the failure easier to understand.

You only need to change the answers inside the braces. The surrounding Ruby code
will become familiar in later exercises. Save to rerun the checks automatically.

Adapted from **Ruby Koans: About Asserts** by Jim Weirich and Joe O'Brien.
Licensed under [CC BY-NC-SA 3.0](https://creativecommons.org/licenses/by-nc-sa/3.0/).
