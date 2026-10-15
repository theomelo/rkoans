# Build readers without losing names

Implement `readers(names)` to return a new class with one instance reader per name, using define_method and instance_variable_get. Each method must retain its own name. Implement `evaluate(factor)` to evaluate "factor * 2" in its local binding. `instance_value(object,name)` should return that object’s @name through reflection. `class_value` should evaluate a class-level expression in the generated class context.

Use `rkoans check` to investigate one failing check at a time. Hints are optional.

Edit `dynamic_methods.rb` in this exercise's folder. Checks call
`Exercises::DynamicMethods` and its example classes.
