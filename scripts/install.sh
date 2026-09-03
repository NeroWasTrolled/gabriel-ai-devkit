#!/usr/bin/env bash
set -euo pipefail

target="all"
mode="link"
refresh_copies="false"
global_instructions="false"
user_root="$HOME"

while [[ $# -gt 0 ]]; do
  case "$1" in
    --target) target="$2"; shift 2 ;;
    --mode) mode="$2"; shift 2 ;;
    --refresh-copies) refresh_copies="true"; shift ;;
    --global-instructions) global_instructions="true"; shift ;;
    --user-root) user_root="$2"; shift 2 ;;
    *) echo "Unknown option: $1" >&2; exit 2 ;;
  esac
done

if [[ ! "$target" =~ ^(all|codex|claude)$ ]]; then
  echo "--target must be all, codex, or claude" >&2
  exit 2
fi
if [[ ! "$mode" =~ ^(link|copy)$ ]]; then
  echo "--mode must be link or copy" >&2
  exit 2
fi
if [[ -z "$user_root" || "$user_root" != /* ]]; then
  echo "--user-root must be an absolute path" >&2
  exit 2
fi

script_dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
repo_root="$(cd "$script_dir/.." && pwd)"
skills_root="$repo_root/skills"
installed=0
skipped=0

install_for() {
  local agent_name="$1"
  local destination="$2"
  local instruction_source="$3"
  local instruction_destination="$4"

  mkdir -p "$destination"
  echo "[$agent_name] $destination"

  for skill in "$skills_root"/*; do
    [[ -d "$skill" ]] || continue
    local name
    name="$(basename "$skill")"
    local destination_path="$destination/$name"

    if [[ ! -f "$skill/SKILL.md" ]]; then
      echo "  SKIP $name (SKILL.md not found)"
      skipped=$((skipped + 1))
      continue
    fi

    if [[ -e "$destination_path" || -L "$destination_path" ]]; then
      if [[ "$mode" == "copy" && "$refresh_copies" == "true" ]]; then
        rm -rf -- "$destination_path"
      else
        echo "  SKIP $name (destination already exists)"
        skipped=$((skipped + 1))
        continue
      fi
    fi

    if [[ "$mode" == "link" ]]; then
      ln -s "$skill" "$destination_path"
    else
      cp -R "$skill" "$destination_path"
    fi
    echo "  OK   $name"
    installed=$((installed + 1))
  done

  if [[ "$global_instructions" == "true" ]]; then
    mkdir -p "$(dirname "$instruction_destination")"
    if [[ -e "$instruction_destination" || -L "$instruction_destination" ]]; then
      echo "  SKIP global instructions (destination already exists)"
    elif [[ "$mode" == "link" ]]; then
      ln -s "$instruction_source" "$instruction_destination"
      echo "  OK   global instructions"
    else
      cp "$instruction_source" "$instruction_destination"
      echo "  OK   global instructions"
    fi
  fi
}

if [[ "$target" == "all" || "$target" == "codex" ]]; then
  install_for "Codex" "$user_root/.agents/skills" "$repo_root/config/AGENTS.md" "$user_root/.codex/AGENTS.md"
fi
if [[ "$target" == "all" || "$target" == "claude" ]]; then
  install_for "Claude Code" "$user_root/.claude/skills" "$repo_root/config/CLAUDE.md" "$user_root/.claude/CLAUDE.md"
fi

echo "Installed: $installed | Skipped: $skipped"
echo "Restart an open agent session if the new skills do not appear immediately."
