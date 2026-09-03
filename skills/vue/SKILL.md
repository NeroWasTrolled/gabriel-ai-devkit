---
name: vue
description: Implement or review Vue 3 components and application features using Composition API, TypeScript, reactivity, component contracts, routing, and state patterns appropriate to the existing project.
---

# Vue

Follow the project's Vue, TypeScript, router, state, styling, and build versions.

- Prefer `<script setup>` and Composition API for new Vue 3 code unless the
  repository establishes another convention.
- Keep props immutable, emits explicit, and component public APIs small.
- Use computed state for derivation and watchers only for side effects.
- Preserve reactivity when destructuring, storing, and crossing composable boundaries.
- Separate reusable domain behavior into focused composables; do not hide trivial
  component logic behind abstraction.
- Model loading, empty, success, stale, forbidden, and error states explicitly.
- Keep routing, server state, client state, and form state conceptually distinct.
- Clean up listeners, timers, observers, subscriptions, and async effects.

Test behavior at the most stable public boundary. Run type checking, unit tests,
linting, and the production build relevant to the change.
