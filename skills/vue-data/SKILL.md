---
name: vue-data
description: Design or debug server-state fetching, caching, pagination, optimistic updates, race conditions, cancellation, and synchronization in Vue applications.
---

# Vue Data

Treat remote data as server state, not a generic global variable.

1. Define the canonical query key from every input that changes the result.
2. Make ownership of caching, freshness, invalidation, retry, and deduplication explicit.
3. Prevent stale responses from overwriting newer intent through cancellation,
   request identity, or library-supported concurrency control.
4. Model initial loading separately from background refresh and empty results.
5. For mutations, define validation, optimistic state, rollback, invalidation,
   reconciliation, duplicate submission, and partial failure.
6. Preserve pagination and filter state intentionally across navigation.

Prefer the data library already in the repository. Avoid duplicating the same
server entity across unrelated stores without a synchronization contract. Never
cache sensitive data longer or more broadly than the product requires.
