---
name: webapp-testing
description: Test a local or authorized web application through a real browser, covering user journeys, state transitions, console errors, network behavior, responsiveness, and screenshots.
---

# Web Application Testing

Test observable user behavior rather than implementation details.

1. Confirm the authorized target, launch command, base URL, accounts, and test-data constraints.
2. Start with a smoke journey proving the application is reachable and stable.
3. Exercise the requested happy path plus the most important validation, denial,
   recovery, refresh, back-navigation, and repeat-action paths.
4. Observe URL, visible state, focus, console messages, failed requests, downloads,
   persistence, and side effects.
5. Check representative viewport sizes and keyboard interaction for critical flows.
6. Capture screenshots at decision points or failures, not after every click.
7. Report exact reproduction steps, expected and actual results, evidence, and severity.

Avoid production mutations unless explicitly authorized. Use isolated test data
and clean it up when safe. A successful page load is not a successful journey.
