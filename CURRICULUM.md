# Ruby curriculum

The Ruby track combines the MRI-compatible Ruby Koans chapters with implementation
exercises covering the published Ruby Gold version 3 topic outline. Lessons build
from predictions about Ruby expressions to small programming projects.

## Ruby Koans scope

The sequence includes all 33 MRI-compatible `about_*` chapters in the source
curriculum, including the optional extra-credit project. Another 26 exercises,
including the heredoc prediction lesson, bring the track to 59 lessons.
`about-pattern-matching` is included even though the source runner restricts it
to older runtime versions.

The JRuby-only `about_java_interop` chapter is excluded: this gem targets MRI Ruby
4.0.7 and does not provide a Java runtime. Obsolete Ruby 1.8 behavior is explained
or replaced with current behavior, rather than presented as a current answer.
For example, indexing a string returns a string, and `self` can receive a private
method call in modern Ruby.

The triangle projects are independent learner files, so part two supplies a
classifier to extend. File examples use real temporary files rather than requiring
a file in the caller's working directory. Dice checks replay a seeded random
stream; they never assume that two random rolls must differ. The original
free-form extra credit is adapted as a deterministic Greed engine repair, with
an optional interface or automated player left for further practice.

See [third-party notices](THIRD_PARTY_NOTICES.md) for Koans attribution and terms.

## Gold topics

Mapped against the Ruby Association's [official Gold version 3 outline](https://www.ruby.or.jp/en/certification/examination/)
on October 14, 2026. The exam targets **Ruby 3.1.x**; Rkoans runs on **Ruby 4.0.7 or
newer**. These are practice examples for every published topic category, not an
exhaustive model of the exam or a guarantee of exam readiness. Runtime-specific
behavior can differ, and the suite has not been validated on Ruby 3.1.

Each link points to an independent Minitest check; the named method identifies a
concrete behavior checked there. References are teaching examples, not the source
of expected values inside those checks. Checks establish observable behavior;
they do not require one particular implementation technique.

| Topic | Exercise check | Behavior exercised |
| --- | --- | --- |
| `environment.predefined` | [runtime-context: `test_runtime_globals`](test/exercises/runtime_context_test.rb) | ARGV and ENV; runtime constants and empty/missing input checks |
| `syntax.literals` | [literals-and-operators: `test_literals_and_precedence`](test/exercises/literals_and_operators_test.rb) | Literal values and numeric division |
| `syntax.variables_constants` | [constant-scope: `test_scope_predictions`](test/exercises/constant_scope_test.rb) | Lexical constants, shared class state and local scope |
| `syntax.operators` | [literals-and-operators: `test_short_circuit_default`](test/exercises/literals_and_operators_test.rb) | Precedence, truthiness and nil-only defaults |
| `syntax.blocks` | [blocks-and-methods: `test_apply_block`](test/exercises/blocks_and_methods_test.rb) | Yielded arguments, result and invocation count |
| `syntax.exceptions` | [exception-flow: `test_ensure_and_else`](test/exercises/exception_flow_test.rb) | Rescue, else, ensure and reraising |
| `syntax.nonlocal_exit` | [nonlocal-exit: `test_catch_throw_and_next`](test/exercises/nonlocal_exit_test.rb) | Catch/throw, next, and escaped proc return |
| `syntax.keywords` | [keyword-forwarding: `test_keyword_and_block`](test/exercises/keyword_forwarding_test.rb) | Keywords, defaults, positional hashes and blocks |
| `syntax.numbered_parameters` | [numbered-parameters: `test_numbered_pair_input`](test/exercises/numbered_parameters_test.rb) | Numbered block arguments and syntax predictions |
| `syntax.lambda` | [closure-capture: `test_lambda_contract`](test/exercises/closure_capture_test.rb) | Lambda identity, strict arity and independent captures |
| `syntax.pattern_matching` | [pattern-matching: `test_pinned_kind`](test/exercises/pattern_matching_test.rb) | Pinned values, type patterns and guards |
| `syntax.heredocs` | [heredoc-layout: `test_squiggly_indentation`](test/exercises/heredoc_layout_test.rb) | Indentation and interpolation |
| `oop.methods` | [method-contracts: `test_parameter_metadata`](test/exercises/method_contracts_test.rb) | Parameter kinds, required keywords, defaults and blocks |
| `oop.access` | [visibility: `test_protected_peer_calls`](test/exercises/visibility_test.rb) | Protected peer access and private normalization |
| `oop.classes` | [class-state: `test_independent_class_instance_state`](test/exercises/class_state_test.rb) | Independent class-object instance state |
| `oop.inheritance` | [class-state: `test_class_inheritance_and_singleton`](test/exercises/class_state_test.rb) | Superclass method calls and singleton ancestry |
| `oop.modules` | [method-lookup: `test_ancestor_order`](test/exercises/method_lookup_test.rb) | Module lookup order and wrapping |
| `oop.prepend` | [method-lookup: `test_prepend_wrapper`](test/exercises/method_lookup_test.rb) | Prepending a wrapper around the original method |
| `oop.refinements` | [refinement-scope: `test_lexical_refinement`](test/exercises/refinement_scope_test.rb) | Lexical activation and behavior outside the scope |
| `meta.eval` | [dynamic-methods: `test_eval_binding_and_reflection`](test/exercises/dynamic_methods_test.rb) | Evaluation with a captured local binding |
| `meta.define_method` | [dynamic-methods: `test_defined_reader_closures`](test/exercises/dynamic_methods_test.rb) | Dynamically defined readers with separate captured names |
| `meta.instance_variables` | [dynamic-methods: `test_eval_binding_and_reflection`](test/exercises/dynamic_methods_test.rb) | Reflective instance-variable access and class evaluation |
| `builtin.object` | [core-protocols: `test_enumerable_protocol`](test/exercises/core_protocols_test.rb) | Object membership and capability introspection |
| `builtin.module` | [method-lookup: `test_ancestor_order`](test/exercises/method_lookup_test.rb) | Module ancestry; dynamic methods also exercise Module APIs |
| `builtin.kernel` | [dynamic-methods: `test_eval_binding_and_reflection`](test/exercises/dynamic_methods_test.rb) | Kernel eval and binding; enum_for in core protocols |
| `builtin.enumerable` | [core-protocols: `test_enumerable_protocol`](test/exercises/core_protocols_test.rb) | Custom each powering map and enumeration |
| `builtin.comparable` | [core-protocols: `test_comparable_and_conversion`](test/exercises/core_protocols_test.rb) | Comparison protocol, ordering and printable conversion |
| `builtin.numeric` | [numeric-precision: `test_numeric_division`](test/exercises/numeric_precision_test.rb) | Integer, Float, Rational and Complex type/value contracts |
| `builtin.regexp` | [regexp-captures: `test_whole_string_and_captures`](test/exercises/regexp_captures_test.rb) | Whole-string anchors, named captures and Integer conversion |
| `builtin.proc` | [nonlocal-exit: `test_proc_nonlocal_return`](test/exercises/nonlocal_exit_test.rb) | Escaped proc return; closures and lambdas in closure-capture |
| `builtin.enumerator` | [lazy-enumeration: `test_lazy_limit`](test/exercises/lazy_enumeration_test.rb) | Finite demand from an unbounded lazy enumerator |
| `stdlib.time` | [time-and-date: `test_time_offset`](test/exercises/time_and_date_test.rb) | Parsing an explicit offset and converting to UTC |
| `stdlib.date` | [time-and-date: `test_calendar_days`](test/exercises/time_and_date_test.rb) | Signed calendar-day distances across leap day |
| `stdlib.singleton` | [singleton-pattern: `test_singleton_identity`](test/exercises/singleton_pattern_test.rb) | Stable identity and an inaccessible constructor |
| `stdlib.forwardable` | [delegation: `test_live_receiver`](test/exercises/delegation_test.rb) | Delegation to a live receiver and return-value preservation |

## Returning learners

Your selected exercise, saved edits and completion history are preserved across
updates. Newly added lessons earlier in the sequence are not visited automatically.
Use `rkoans list` to find them and `rkoans start EXERCISE` to select one. Then use
`rkoans check` to check the selected exercise once, or save while watching.
