---
name: audit-context-building
description: Build a precise architectural and security-relevant model of an unfamiliar codebase before an audit, major review, or risky change. Do not report vulnerabilities until the supporting code path is traced.
---

# Audit Context Building

Construct an evidence-backed map of the system.

- Identify entrypoints, actors, assets, deployment boundaries, and trust boundaries.
- Trace untrusted inputs through parsing, validation, authorization, persistence,
  side effects, and outputs.
- Map authentication, authorization, identity propagation, tenancy, and privilege.
- Identify state transitions, invariants, error paths, retries, concurrency, and
  external dependencies.
- Follow important calls to their implementation rather than stopping at names.
- Record assumptions with the file, symbol, configuration, or test supporting them.

Deliver a concise architecture map, attack surface, high-value flows, unresolved
questions, and recommended audit targets. Clearly label inferred behavior. Do
not treat framework defaults as facts without checking configuration and version.
