#!/bin/sh
# test-harness.sh — run every harness test suite (fgw, Conv 003, DEC-003-2).
#
# Finds all *.test.sh under .claude/ — behaviour suites AND *.mutation.test.sh mutation
# checks alike — runs each with sh, prints a per-suite PASS/FAIL line, and exits non-zero if
# any suite fails (so "did the harness stay green?" is one command). On failure it re-runs the
# offending suite with output shown (indented) so the detail is right there.
# This file is not itself a *.test.sh, so it never recurses into itself.
# Run: sh .claude/scripts/test-harness.sh

ROOT="${CLAUDE_PROJECT_DIR:-$HOME/projects/fgw-26-docs}"
CLAUDE_DIR="$ROOT/.claude"
fails=0
total=0

for suite in $(find "$CLAUDE_DIR" -name '*.test.sh' | sort); do
  total=$((total + 1))
  name=${suite#"$ROOT/"}
  if sh "$suite" >/dev/null 2>&1; then
    printf 'PASS | %s\n' "$name"
  else
    printf 'FAIL | %s\n' "$name"
    sh "$suite" 2>&1 | sed 's/^/     /'
    fails=$((fails + 1))
  fi
done

echo "----"
printf '%s suite(s), %s failed\n' "$total" "$fails"
[ "$fails" -eq 0 ] || exit 1
