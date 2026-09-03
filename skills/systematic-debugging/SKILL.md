---
name: systematic-debugging
description: Diagnose a reproducible bug, failing test, crash, regression, or unexpected behavior by establishing evidence and root cause before editing. Do not use for feature implementation without a defect.
---

# Systematic Debugging

Treat debugging as evidence gathering, not speculative editing.

1. Capture the observed behavior, expected behavior, environment, and impact.
2. Reproduce the failure with the smallest reliable command or scenario.
3. Read the complete error and trace data; preserve the first meaningful failure.
4. Trace the relevant data and control flow across boundaries.
5. Form one falsifiable root-cause hypothesis at a time.
6. Run the cheapest discriminating check before modifying production code.
7. Add or identify a regression test that fails for the proven cause.
8. Apply the smallest complete fix, then run focused and broader verification.

If reproduction is impossible, say what evidence is missing and instrument the
system narrowly. Do not stack unrelated fixes. Separate the root cause from
secondary symptoms and incidental cleanup.
