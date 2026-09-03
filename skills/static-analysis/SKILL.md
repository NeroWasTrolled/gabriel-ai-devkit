---
name: static-analysis
description: Select, configure, run, or interpret static analysis for application code using tools such as Semgrep, CodeQL, language analyzers, and SARIF, with explicit scope and false-positive validation.
---

# Static Analysis

Choose the tool and ruleset from the language, build model, threat surface, and
question being investigated.

- Record target revision, paths, generated or vendored exclusions, configuration,
  tool version, rule version, and whether the build was complete.
- Prefer repository-native analyzers before adding another scanner.
- Treat results as hypotheses. Trace source, sanitization, control flow, sink,
  reachability, and deployment conditions before calling something vulnerable.
- Preserve raw output or SARIF when the user needs reproducibility.
- Deduplicate related alerts by root cause and prioritize reachable impact.
- Tune exclusions narrowly and document why a result is suppressed.

Never advertise a clean scan as proof of safety. If a tool cannot model the
framework or build, explain the blind spot and complement it with targeted review.
