# Rkoans

Learn Ruby by editing code and watching Minitest checks respond to each save.

## Get started

Rkoans requires Ruby 4.0.7 or newer. From a source checkout, run:

```sh
bundle install
bundle exec rkoans
```

Rkoans creates your study directory at `~/ruby-koans`, shows the exercise
instructions, and prints the file to edit. The starter intentionally fails.
Save your changes to rerun the checks automatically.

Running `rkoans` again resumes your selected exercise and preserves your edits.
Once the gem is installed, you can run it from any directory.
`rkoans start` has the same behavior as `rkoans`.

## Commands

```sh
rkoans list                       # List available exercises
rkoans start blocks-and-methods    # Select an exercise
rkoans check                      # Check the selected exercise once
```

Each exercise has a separate file in `~/ruby-koans/exercises`, such as
`collection-basics/collection_basics.rb`. Switching exercises preserves your work.

`rkoans check` exits with 0 for success, 1 for failed checks, or 2 for a setup or
command error. Checks that run longer than 30 seconds are stopped.

## Interactive session

The terminal refreshes after each check. When an exercise passes, Rkoans shows
`Exercise done ✓`, your progress, and a reference solution you can compare with
your own code. The exercise stays open so you can experiment.

- `?` shows keyboard help.
- `h` shows a hint for the unfinished current exercise.
- `l` lists exercises; `s` returns to the current exercise.
- `n` followed by Enter advances to the next exercise.
- `q` followed by Enter quits. Ctrl-C also exits.

Help, hints, and view changes respond immediately. Available keys appear at the
bottom of each screen. Saving while viewing the list keeps the list open.

Rkoans remembers completed exercises, even if you later experiment with their
code. Advancing checks your current code again and requires it to pass.

## Licenses

The CLI and original exercises use the MIT license. Adapted Ruby Koans lessons
use CC BY-NC-SA 3.0; see [third-party notices](THIRD_PARTY_NOTICES.md) for their
attribution, covered files, and license terms.

## Development

From the gem directory:

```sh
bundle exec rake
gem build rkoans.gemspec
```
