---
name: claude-security
description: Conduct an authorized, deep application security review using the native Claude Security capability when available, with a portable evidence-driven fallback when it is not. Use only when a broad security audit is explicitly requested.
---

# Claude Security Adapter

If the official Claude Security plugin is available, invoke its maintained audit
workflow and follow its permissions and output contract. Do not claim plugin use
when it is unavailable.

Fallback workflow:

1. Confirm scope, authorization, environment, excluded systems, and output sensitivity.
2. Build an architecture and trust-boundary model from the code and configuration.
3. Rank attack surfaces by reachable privilege and asset impact.
4. Review high-risk flows across authentication, authorization, injection,
   deserialization, SSRF, file handling, secrets, cryptography, and business logic.
5. Verify each candidate through code tracing, focused analysis, or safe reproduction.
6. Deduplicate findings by root cause and document evidence and preconditions.
7. Produce fixes only when requested, keeping remediation minimal and testable.

Never attack third-party or production systems without explicit authorization.
Absence of findings is not proof of security.
