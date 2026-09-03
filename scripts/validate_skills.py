#!/usr/bin/env python3
"""Validate the portable structure and required metadata of every skill."""

from __future__ import annotations

import re
import sys
from pathlib import Path


NAME_RE = re.compile(r"^[a-z0-9]+(?:-[a-z0-9]+)*$")
FIELD_RE = re.compile(r"^(name|description):\s*(.+?)\s*$")
EXPECTED_SKILLS = {
    "audit",
    "audit-context-building",
    "brainstorming",
    "claude-security",
    "codex-security",
    "design-qa",
    "differential-review",
    "frontend-app-builder",
    "frontend-design",
    "frontend-testing-debugging",
    "game-playtest",
    "game-ui-frontend",
    "modern-python",
    "playwright",
    "postgres-best-practices",
    "product-design",
    "product-gamification",
    "property-based-testing",
    "security-guidance",
    "sharp-edges",
    "static-analysis",
    "supply-chain-risk-auditor",
    "systematic-debugging",
    "variant-analysis",
    "vue",
    "vue-a11y",
    "vue-clean-components",
    "vue-data",
    "vue-forms",
    "vue-performance",
    "webapp-testing",
    "writing-plans",
}


def parse_frontmatter(path: Path) -> tuple[dict[str, str], list[str]]:
    errors: list[str] = []
    text = path.read_text(encoding="utf-8")
    lines = text.splitlines()
    if not lines or lines[0].strip() != "---":
        return {}, ["missing opening YAML delimiter"]
    try:
        end = lines.index("---", 1)
    except ValueError:
        return {}, ["missing closing YAML delimiter"]

    fields: dict[str, str] = {}
    for line in lines[1:end]:
        match = FIELD_RE.match(line)
        if match:
            fields[match.group(1)] = match.group(2).strip('"\'')
        elif line.strip():
            errors.append(f"unsupported or malformed frontmatter: {line}")

    if not "\n".join(lines[end + 1 :]).strip():
        errors.append("instruction body is empty")
    return fields, errors


def main() -> int:
    root = Path(__file__).resolve().parents[1]
    skills_root = root / "skills"
    failures: list[str] = []
    directories = sorted(path for path in skills_root.iterdir() if path.is_dir())

    if not directories:
        print("No skills found.", file=sys.stderr)
        return 1

    actual_skills = {directory.name for directory in directories}
    for missing in sorted(EXPECTED_SKILLS - actual_skills):
        failures.append(f"{missing}: expected skill directory is missing")
    for unexpected in sorted(actual_skills - EXPECTED_SKILLS):
        failures.append(f"{unexpected}: directory is not present in the catalog")

    for directory in directories:
        skill_file = directory / "SKILL.md"
        if not skill_file.is_file():
            failures.append(f"{directory.name}: missing SKILL.md")
            continue

        fields, errors = parse_frontmatter(skill_file)
        name = fields.get("name", "")
        description = fields.get("description", "")
        if not name:
            errors.append("missing name")
        elif name != directory.name:
            errors.append(f"name '{name}' does not match directory")
        elif len(name) > 64 or not NAME_RE.fullmatch(name):
            errors.append("name must be kebab-case and at most 64 characters")
        if not description:
            errors.append("missing description")
        elif len(description) > 500:
            errors.append("description is too long")

        failures.extend(f"{directory.name}: {error}" for error in errors)

    if failures:
        print("Skill validation failed:")
        for failure in failures:
            print(f"- {failure}")
        return 1

    print(f"Validated the complete catalog of {len(directories)} skills successfully.")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
