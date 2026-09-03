---
name: vue-a11y
description: Implement or audit accessibility in Vue interfaces, including semantics, keyboard behavior, focus, forms, live updates, contrast, motion, and component-library integration.
---

# Vue Accessibility

Start with native HTML semantics and add ARIA only when native behavior cannot
express the component.

- Ensure every interactive control is reachable, understandable, and operable by keyboard.
- Preserve visible focus and logical focus order.
- Move focus deliberately after dialogs, route changes, deletions, and errors;
  restore it when temporary UI closes.
- Give fields programmatic labels, instructions, validation state, and error associations.
- Announce meaningful asynchronous changes without making routine updates noisy.
- Respect reduced motion, zoom, reflow, contrast, target size, and text scaling.
- Test custom widgets against established interaction patterns rather than inventing keys.

Verify with keyboard-only use, browser accessibility inspection, automated checks,
and a screen reader for critical flows. Automated tools do not establish usability.
