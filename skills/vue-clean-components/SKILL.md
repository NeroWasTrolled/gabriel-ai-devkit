---
name: vue-clean-components
description: Refactor or review oversized, coupled, or difficult-to-test Vue components by clarifying responsibilities and extracting stable boundaries without fragmenting the UI unnecessarily.
---

# Vue Clean Components

Refactor around reasons to change, not arbitrary line counts.

1. Describe the component's responsibilities, data ownership, side effects, and public contract.
2. Identify cohesive UI sections, reusable behavior, domain calculations, and infrastructure concerns.
3. Extract a child component when it has a clear contract and meaningful independent behavior.
4. Extract a composable when stateful behavior is reusable or obscures the component's intent.
5. Move pure domain transformations to framework-independent modules.
6. Keep orchestration near the owner of the user flow.

Avoid prop drilling created solely by excessive fragmentation, global stores used
as a shortcut, composables that return an unstructured bag of state, and wrappers
that add no semantic value. Preserve behavior with focused tests during extraction.
