---
name: writing-plans
description: Produce an implementation plan for a multi-file, risky, or ambiguous change when sequencing, boundaries, migration, or verification need to be explicit. Do not use for trivial single-file edits.
---

# Writing Plans

Write a plan another engineer can execute without rediscovering the problem.

Before planning, inspect the relevant entrypoints, tests, configuration, data
model, and repository conventions. A plan must include:

- outcome and explicit non-goals;
- current behavior and intended behavior;
- affected components and the responsibility of each change;
- ordered implementation steps with concrete file or module targets;
- data, API, security, compatibility, and rollout implications when relevant;
- verification for happy paths, failure paths, and regressions;
- assumptions, decisions still requiring the user, and rollback strategy.

Keep steps outcome-oriented rather than narrating keystrokes. Avoid inventing
files that have not been verified. Surface risky dependencies early. Prefer
incremental, independently verifiable stages over a single large rewrite.
