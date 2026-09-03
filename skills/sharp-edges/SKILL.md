---
name: sharp-edges
description: Review an API, configuration surface, library, or developer workflow for misuse-prone defaults and interfaces where the easiest path can create security or reliability failures.
---

# Sharp Edges

Find designs that make dangerous behavior easy or silent.

Review:

- insecure defaults, optional validation, fail-open behavior, and ambiguous flags;
- authentication or authorization that callers can forget or bypass;
- stringly typed security decisions and confusing positive/negative booleans;
- APIs that combine trusted and untrusted values without visible boundaries;
- secrets in arguments, URLs, logs, errors, examples, or generated configuration;
- unsafe parsing, deserialization, path handling, command execution, and redirects;
- retry, timeout, concurrency, and partial-failure behavior;
- error messages or return types that hide failure.

For each finding, show a realistic misuse path, impact, and evidence. Prefer
design changes that make the safe path the default: safer types, builders,
required parameters, validation at construction, narrow capabilities, and clear
failure modes. Distinguish a sharp edge from a confirmed vulnerability.
