# An API boundary

Wallet has an internal balance reader used when comparing wallets, and a normalizer used within deposit. Make balance protected, normalize private, and deposit/compare public. Other wallet instances must be able to compare balances, while callers cannot invoke balance or normalize directly. Preserve explicit self.normalize inside deposit: it is valid on the current Ruby.

Use `rkoans check` to investigate one failing check at a time. Hints are optional.

Edit `visibility.rb` in this exercise's folder. Checks call
`Exercises::Visibility` and its example classes.
