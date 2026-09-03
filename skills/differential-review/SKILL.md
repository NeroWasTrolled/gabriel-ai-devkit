---
name: differential-review
description: Review a commit, pull request, patch, or branch difference for security and reliability regressions by understanding both the changed lines and their surrounding execution paths.
---

# Differential Review

Anchor the review to a verified base and target revision.

1. Summarize the intended change from the diff, tests, issue, and affected architecture.
2. Identify new or changed trust boundaries, privileges, inputs, side effects,
   dependencies, configuration, migrations, and error behavior.
3. Trace callers and callees beyond the diff when they determine exploitability or correctness.
4. Look for removed validation, widened access, fail-open behavior, unsafe defaults,
   partial updates, concurrency changes, and missing negative tests.
5. Validate each issue against the full resulting code, not an isolated hunk.

Report findings first, ordered by severity, with file or symbol evidence, scenario,
impact, confidence, and remediation. Separate pre-existing issues from regressions
introduced by the change. If no issue is found, state the reviewed scope and blind spots.
