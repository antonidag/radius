#!/bin/sh

HOOKS_DIR=".git/hooks"
HOOK="$HOOKS_DIR/commit-msg"

mkdir -p "$HOOKS_DIR"
ln -sf ../../scripts/commit-msg.sh "$HOOK"

echo "✅ Git commit-msg hook installed."
