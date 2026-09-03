---
name: property-based-testing
description: Design or review generative tests for parsers, validators, transformations, state machines, calculations, permissions, and business rules. Use Hypothesis for Python or fast-check for TypeScript when available.
---

# Property-Based Testing

Express behavior as invariants over a meaningful input domain.

1. Identify the contract and invariants: round trips, idempotence, monotonicity,
   conservation, ordering, equivalence, or forbidden states.
2. Define generators that reflect valid, invalid, boundary, and adversarial data.
3. Constrain inputs only where the real domain requires it; do not filter away
   the bug surface.
4. Use an independent oracle, model, metamorphic relation, or differential
   implementation when possible.
5. Confirm a failure shrinks to a useful minimal example and preserve it as a
   regression example when valuable.
6. Run examples alongside property tests; neither replaces the other.

Reject tautologies such as comparing a function to itself, properties that are
true only because generators never reach difficult cases, and excessive mocks
that bypass the behavior under test. Record seeds or counterexamples when the
framework does not persist them automatically.
