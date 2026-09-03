---
name: postgres-best-practices
description: Design, review, or optimize PostgreSQL schemas, queries, indexes, transactions, migrations, connections, and row-level security. Do not guess performance without plans or measurements.
---

# PostgreSQL Best Practices

Match recommendations to the deployed PostgreSQL version and workload.

- Model constraints in the database where they protect real invariants.
- Choose types deliberately; avoid lossy text representations and unbounded JSON
  when relational structure is queried or constrained.
- Design indexes from verified query patterns, selectivity, ordering, and write cost.
- Use `EXPLAIN (ANALYZE, BUFFERS)` only on safe environments and representative data.
- Keep transactions short, define isolation expectations, and reason about locks.
- Use parameterized queries and least-privilege roles.
- Treat row-level security policies as authorization code and test cross-tenant denial.
- Make migrations observable, reversible where practical, and safe for table size,
  locks, concurrent application versions, and backfills.
- Bound pools according to database capacity; avoid connection multiplication.

For optimization, report the query, plan evidence, cardinality mismatch, proposed
change, tradeoff, and a before/after measurement. Do not add indexes reflexively.
