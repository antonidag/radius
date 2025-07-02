#!/bin/sh

PATTERN="^(feat|fix|docs|style|refactor|test|chore)(\([^)]+\))?: .{1,}$"
MSG=$(cat "$1")

if ! echo "$MSG" | grep -qE "$PATTERN"; then
  echo "❌ Invalid commit message:"
  echo "→ Must match: <type>(optional-scope): <description>"
  echo "→ Example: fix(auth): handle expired token gracefully"
  exit 1
fi
