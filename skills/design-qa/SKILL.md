---
name: design-qa
description: Compare a rendered implementation with an approved design, specification, or reference and report actionable visual, responsive, interaction, and accessibility differences.
---

# Design QA

Treat the approved reference and product requirements as the target, while
flagging defects in the reference rather than reproducing them silently.

- Compare layout, spacing, typography, color, borders, elevation, imagery, and iconography.
- Verify content wrapping, overflow, truncation, density, and realistic data extremes.
- Exercise interaction, focus, hover, pressed, disabled, loading, empty, error,
  success, and transition states.
- Check representative widths, zoom, keyboard flow, reduced motion, and contrast.
- Inspect console and network errors that alter the rendered result.

Report differences with location, evidence, expected behavior, actual behavior,
severity, and likely owning component or token. Fix systemic token or component
causes before applying one-off pixel patches, then re-render the affected states.
