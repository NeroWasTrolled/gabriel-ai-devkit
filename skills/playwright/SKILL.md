---
name: playwright
description: Create, review, or stabilize Playwright end-to-end tests, fixtures, locators, authentication state, projects, traces, screenshots, and CI execution for authorized web applications.
---

# Playwright

Write tests around durable user-visible contracts.

- Prefer role, label, placeholder, text, and explicit test-id locators over CSS structure.
- Use web-first assertions and Playwright waiting; never add fixed sleeps as synchronization.
- Isolate data and identity so tests can run independently and in parallel.
- Put reusable setup in fixtures without hiding the behavior a test is meant to prove.
- Reuse authenticated state only when isolation and expiry are understood; never commit secrets.
- Mock at controlled external boundaries, not the application behavior under test.
- Preserve traces, screenshots, video, console, and request evidence on failure according to CI cost.
- Test at least one meaningful denial or recovery path for critical journeys.

When stabilizing a flaky test, reproduce across repetitions and workers, identify
the race or shared state, and fix that cause. Do not weaken the assertion merely
to make the suite green.
