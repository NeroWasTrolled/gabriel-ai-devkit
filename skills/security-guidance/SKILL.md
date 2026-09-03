---
name: security-guidance
description: Provide lightweight security guidance while implementing or reviewing application changes, focusing on the changed trust boundaries and common high-impact weakness classes. This is not a full security audit.
---

# Security Guidance

Use an installed native security-guidance integration when available. Otherwise
perform a focused review of the requested change.

For changed code, identify:

- untrusted inputs and output contexts;
- authentication, authorization, tenancy, and object ownership decisions;
- database, command, template, path, URL, parser, and deserialization sinks;
- secrets, tokens, personal data, and sensitive logs;
- outbound requests, redirects, uploads, and filesystem access;
- dependency or configuration changes that alter exposure.

Report only actionable issues supported by a plausible path and code evidence.
Include impact, preconditions, confidence, and the smallest remediation. Distinguish
confirmed findings from hardening suggestions. Do not broaden ordinary feature
work into a repository-wide audit unless requested.
