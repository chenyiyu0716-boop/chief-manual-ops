#!/bin/sh
set -eu

repo_root=$(CDPATH= cd -- "$(dirname -- "$0")/.." && pwd)

patterns='/Users/|/home/|[A-Z]:\\Users\\|BEGIN [A-Z ]*PRIVATE KEY|github\.com/[^ )]+|[0-9a-f]{40}|sk-[A-Za-z0-9_-]{12,}|(token|password|secret|authorization|cookie)[[:space:]]*[:=][[:space:]]*[^<[:space:]]+'

if command -v rg >/dev/null 2>&1; then
  if rg -n -i --hidden \
    --glob '!.git/**' \
    --glob '!SECURITY.md' \
    --glob '!scripts/check-redaction.sh' \
    "$patterns" "$repo_root"; then
    echo "Potential sensitive material found. Review before publishing." >&2
    exit 1
  fi
else
  echo "ripgrep is required for the redaction check." >&2
  exit 2
fi

echo "Redaction pattern scan passed."
