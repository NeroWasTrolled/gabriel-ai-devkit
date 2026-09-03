---
name: variant-analysis
description: Search an authorized codebase for additional instances of a confirmed bug or vulnerability by generalizing its root cause, data flow, and missing invariant without overmatching superficial syntax.
---

# Variant Analysis

Start only after one seed issue has a defensible root cause.

1. Describe the violated invariant, relevant source-to-sink path, preconditions,
   missing control, and framework behavior.
2. Extract structural features and semantic synonyms; do not search only for the
   exact function or variable name.
3. Search from narrow textual matches toward AST, data-flow, query, or custom-rule analysis.
4. Inspect wrappers, alternate entrypoints, background jobs, administrative paths,
   legacy code, and language variants.
5. Validate reachability and mitigations for every candidate.
6. Improve the query using confirmed positives and false positives, then rerun it.

Group results by root cause and remediation strategy. Preserve the search method
so it can become a regression check when the signal is strong enough.
