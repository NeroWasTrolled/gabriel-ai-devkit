---
name: frontend-testing-debugging
description: Diagnose a frontend failure by correlating rendered behavior with browser console, network, DOM, application state, source maps, and focused tests before implementing a fix.
---

# Frontend Testing and Debugging

Reproduce the failure in the smallest realistic browser journey.

- Record browser, viewport, route, user state, data conditions, and exact actions.
- Inspect the earliest console exception and failed network request.
- Distinguish transport, API contract, state management, reactivity, rendering,
  CSS, browser compatibility, race, and stale-cache failures.
- Trace the owning source through source maps and component boundaries.
- Test one falsifiable hypothesis at a time using breakpoints, logs, request
  interception, throttling, or reduced fixtures.
- Add a regression test at the lowest level that reliably reproduces the user impact.
- Implement the smallest fix and repeat the browser journey plus relevant checks.

Do not hide exceptions, add arbitrary delays, or increase timeouts without proving
timing is the cause. Remove temporary instrumentation before delivery.
