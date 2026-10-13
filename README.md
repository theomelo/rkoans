# Rkoans

Learn Ruby by editing code and watching Minitest checks respond to each save.
This first migration includes one exercise: `collection-basics`.

## Try it from this repository

Use mise to select Ruby 4.0.7, then run these commands from `gem/rkoans`:

```sh
mise install
mise exec -- bundle install
mise exec -- bundle exec rkoans
```

The command prints the exercise instructions and the path to edit:
`~/ruby-koans/exercises/collection-basics/solution.rb`. The starter intentionally fails.
Save your changes to rerun the checks. The terminal refreshes after each run;
Ctrl-C exits and preserves your edits. Running `rkoans` again resumes that file.

`rkoans start` has the same behavior. `rkoans check` runs the checks once and
exits with 0 for success, 1 for failed checks, or 2 for a command/setup error.
Checks that run longer than 30 seconds are stopped.

The command automatically creates `~/ruby-koans` for your learner files.
Start and check use this same study directory regardless of where you run them.
The gem includes its own starter and checks and does not need the parent project.
For an installed gem, simply run `rkoans` from any directory.

## Development

```sh
mise exec -- bundle exec rake
mise exec -- gem build rkoans.gemspec
```

Additional exercises, hints, progress tracking, Rails, and Docker will migrate
in later increments.
