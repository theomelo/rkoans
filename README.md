# Rkoans

Learn Ruby by editing code and watching Minitest checks respond to each save.
The migrated exercises are `collection-basics` and `blocks-and-methods`.

## Try it from this repository

Use mise to select Ruby 4.0.7, then run these commands from `gem/rkoans`:

```sh
mise install
mise exec -- bundle install
mise exec -- bundle exec rkoans
```

The command prints the exercise instructions and the path to edit:
`~/ruby-koans/exercises/collection-basics/collection_basics.rb`. The starter intentionally fails.
Save your changes to rerun the checks. The terminal refreshes after each run;
Ctrl-C exits and preserves your edits. Running `rkoans` again resumes that file.

`rkoans start` has the same behavior. `rkoans check` runs the checks once and
exits with 0 for success, 1 for failed checks, or 2 for a command/setup error.
Checks that run longer than 30 seconds are stopped.

Use `rkoans list` to see the available exercise IDs. To select the second exercise:

```sh
rkoans start blocks-and-methods
```

Each exercise has its own file named after its class:
`~/ruby-koans/exercises/collection-basics/collection_basics.rb` or
`~/ruby-koans/exercises/blocks-and-methods/blocks_and_methods.rb`.
Selection is saved in `~/ruby-koans/.rkoans/selection`. Running `rkoans`,
`rkoans start`, or `rkoans check` again uses that selection. Switching exercises
preserves your previous edits. A new study directory starts with `collection-basics`.

After passing, the session shows `Exercise done ✓`, a packaged reference solution
path, and your progress. It keeps the current exercise open so you can experiment.
Press `l` to list exercises or `s` to show the current exercise immediately.
Use `n` followed by Enter to advance, or `q` followed by Enter to quit.
The list view shows `s`, `n`, and `q`; saving while in that view keeps the list open.
`?` is available in every interactive view and shows keyboard help immediately.
`h` shows a hint immediately while working on an unfinished current exercise;
it is hidden in the list and on the completed screen.
Ctrl-C also exits. Advancing reruns the current checks before moving on.
The last exercise stays open with an all-complete message when you enter `n`.

Completion history is saved in `~/ruby-koans/.rkoans/completed.json`.
Restarting resumes the selected exercise even when it has been completed.
Experimenting with a completed exercise does not remove its completion history,
but its current checks must pass before you advance.

The command automatically creates `~/ruby-koans` for your learner files.
Start and check use this same study directory regardless of where you run them.
The gem includes its own starter and checks and does not need the parent project.
For an installed gem, simply run `rkoans` from any directory.

## Development

```sh
mise exec -- bundle exec rake
mise exec -- gem build rkoans.gemspec
```

Additional exercises, reset, check-all, Rails, and Docker will migrate
in later increments.
