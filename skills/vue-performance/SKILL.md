---
name: vue-performance
description: Investigate and improve Vue rendering, reactivity, bundle, network, and memory performance using measurements. Do not use for speculative micro-optimization.
---

# Vue Performance

Establish a user-visible performance problem and a repeatable measurement first.

- Profile component updates before changing reactivity structures.
- Identify unstable props, deep watchers, unnecessary reactive graphs, expensive
  computed work, repeated serialization, and retained effects.
- Virtualize only proven large-list bottlenecks and preserve accessibility.
- Use route or feature code splitting where it reduces critical work without
  causing request waterfalls.
- Inspect bundle composition before replacing dependencies.
- Optimize images, fonts, and network priority according to the rendered journey.
- Clean up effects and detached DOM references when investigating memory growth.

Report the baseline, bottleneck evidence, change, regression risks, and result
under the same conditions. Preserve correctness before chasing benchmark gains.
