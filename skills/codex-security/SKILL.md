---
name: codex-security
description: Conduct an authorized, deep application security review using the native Codex Security capability when available, with a portable evidence-driven fallback when it is not. Use only when a broad security audit is explicitly requested.
---

# Codex Security Adapter

If the official Codex Security plugin or scanner is available, use its maintained
scan and validation workflow. State which capability actually ran. Do not emulate
native multi-pass behavior by merely naming it.

Fallback workflow:

1. Confirm authorization, repository scope, target revision, exclusions, and risk tolerance.
2. Map entrypoints, assets, identities, trust boundaries, data stores, and deployment controls.
3. Prioritize externally reachable and privilege-changing flows.
4. Combine manual tracing with available static analysis, tests, and dependency checks.
5. Validate candidate findings and reject unreachable or framework-mitigated false positives.
6. Report root cause, affected code, attack path, impact, preconditions, confidence,
   remediation, and a regression test strategy.

Separate confirmed vulnerabilities, probable findings, and hardening opportunities.
Never modify findings or production code unless the user requested remediation.
