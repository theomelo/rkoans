# One configuration object

Use the standard-library Singleton module so Configuration.instance returns the same instance and Configuration.new is not a public constructor. Keep the default mode "learning". Distinguish this module from singleton methods, which are methods on one object.

Use `rkoans check` to investigate one failing check at a time. Hints are optional.

Edit `singleton_pattern.rb` in this exercise's folder. Checks call
`Exercises::SingletonPattern` and its example classes.
