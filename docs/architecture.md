# Architecture

## Single source of truth

Every skill lives once under `skills/<name>/SKILL.md`. Installers expose those
directories to the user-level discovery path of each supported agent.

```text
skills/<name>
   ├── junction/symlink -> ~/.agents/skills/<name>
   └── junction/symlink -> ~/.claude/skills/<name>
```

Link mode is preferred because a `git pull` updates both agents immediately.
Copy mode exists for restricted machines, containers, and filesystems that do
not support links.

## Selection model

Skills use progressive disclosure. The agent initially sees `name` and
`description`; it reads the remaining instructions only when the skill is
selected. Descriptions are intentionally narrow to reduce accidental triggers.

## Precedence

Project-specific instructions should override portable preferences when they
represent the repository's established conventions. Security and authorization
constraints remain in force regardless of style preferences.

## Portability boundary

The shared files use only portable Agent Skills frontmatter: `name` and
`description`. Claude-specific dynamic injection and Codex-only UI metadata are
not used in shared entrypoints.

The repository does not attempt to emulate unavailable proprietary tools.
Adapter skills select native integrations when present and fall back to an
explicitly scoped local workflow.
