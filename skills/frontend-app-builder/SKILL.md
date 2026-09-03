---
name: frontend-app-builder
description: Build a complete frontend feature or small web application from a product brief, combining interaction design, maintainable implementation, responsive states, and browser verification.
---

# Frontend App Builder

Work from product outcome to rendered behavior.

1. Inspect the repository, available assets, design primitives, routes, and data contracts.
2. Define the primary user journey, information architecture, and acceptance criteria.
3. Establish a visual direction appropriate to the product rather than defaulting to a template.
4. Implement the smallest coherent vertical slice using existing conventions.
5. Cover responsive layout, keyboard use, loading, empty, error, success, and permission states.
6. Run type checks, tests, lint, and production build as applicable.
7. Exercise the actual interface in a browser and inspect console and network failures.

Do not invent backend behavior silently. Use fixtures or adapters with explicit
boundaries when the API is unavailable. Prefer real content shapes over polished
screens that collapse under actual data.
