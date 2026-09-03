---
name: vue-forms
description: Build or review accessible Vue forms with validation, nested data, uploads, async submission, error recovery, and deliberate dirty and pending states.
---

# Vue Forms

Design the form as a state machine rather than a collection of inputs.

- Define initial, dirty, validating, submitting, succeeded, and failed states.
- Use semantic labels, fieldsets, descriptions, and error associations.
- Validate for immediate guidance on the client and enforce the contract again
  on the server; keep rules aligned without assuming the client is trusted.
- Preserve user input after recoverable failures and focus the first actionable error.
- Prevent accidental duplicate submission while preserving retry.
- Distinguish field errors, form errors, authorization failures, and network errors.
- For files, validate type and size on both sides, show progress when meaningful,
  and handle cancellation and partial uploads.
- Warn about unsaved work only when real data would be lost.

Test keyboard interaction, validation timing, server error mapping, resubmission,
and slow or interrupted requests.
