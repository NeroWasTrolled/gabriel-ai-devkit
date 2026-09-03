---
name: modern-python
description: Create, review, or modernize Python applications and backend services using current typing, packaging, testing, linting, async, and dependency practices while respecting the repository's established toolchain.
---

# Modern Python

Use the project's supported Python version and existing conventions first.

- Prefer clear modules, explicit boundaries, type annotations, and standard
  library solutions before adding dependencies.
- Keep domain logic separate from transport, persistence, and framework glue.
- Model expected failures explicitly; do not swallow exceptions or expose internals.
- Use context managers for resources and structured concurrency for async work.
- Avoid blocking calls in async paths and make cancellation and timeouts deliberate.
- Use `pyproject.toml` as the central project configuration when compatible.
- Prefer `uv`, Ruff, Pyright, and pytest when selecting a new toolchain; do not
  migrate an established project without a demonstrated benefit and approval.
- Validate untrusted data at boundaries and use parameterized APIs.
- Add focused tests for behavior, including boundary and failure cases.

Run the repository's formatter, linter, type checker, tests, and build/package
checks that are relevant to the change. Report unavailable checks explicitly.
