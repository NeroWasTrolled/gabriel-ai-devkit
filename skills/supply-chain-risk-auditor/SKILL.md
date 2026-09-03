---
name: supply-chain-risk-auditor
description: Assess software supply-chain risk across dependencies, lockfiles, registries, build scripts, CI, release provenance, maintainer health, and update policy. Do not equate vulnerability counts with overall risk.
---

# Supply Chain Risk Auditor

Confirm the ecosystem, manifests, lockfiles, resolved graph, registry sources,
build and release path, and deployment artifacts.

- Check known vulnerabilities with ecosystem-appropriate tools and validate applicability.
- Identify unpinned sources, mutable tags, abandoned or unusually concentrated
  maintenance, suspicious ownership changes, typosquatting, and dependency confusion exposure.
- Review install scripts, binary downloads, code generation, CI actions, and release credentials.
- Check provenance, signatures, checksums, protected publishing, and reproducible build controls.
- Distinguish direct, transitive, dev-only, build-time, optional, and runtime exposure.
- Recommend removal, replacement, isolation, pinning, monitored acceptance, or upgrade
  according to exploitability and operational cost.

Record evidence date and data-source limitations. Never run package lifecycle
scripts from an untrusted dependency merely to inspect it.
