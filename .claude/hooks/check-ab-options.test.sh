#!/bin/sh
# check-ab-options.test.sh — deterministic tests for the A/B Stop guard (fgw, Conv 002).
#
# Drives check-ab-options.sh with crafted `last_assistant_message` stdin and asserts the
# exit code (0 = allow stop, 2 = block + re-ask). Run: sh check-ab-options.test.sh
# No network, no transcript, no CC — pure logic. Covers the trailing-question-block rule
# and the near-misses that must NOT be mistaken for labels.

HERE=$(dirname "$0")
HOOK="$HERE/check-ab-options.sh"
TMP=$(mktemp -d)
trap 'rm -rf "$TMP"' EXIT
A=$(printf '\xf0\x9f\x91\x89\xf0\x9f\x91\x89\xf0\x9f\x91\x89')   # 👉👉👉
fails=0

check() { # $1 label  $2 want-exit  $3 active(true/false)  $4 text
  json=$(jq -n --arg t "$4" --argjson a "$3" --arg sd "$TMP" \
    '{last_assistant_message:$t, stop_hook_active:$a, scratchpad_dir:$sd}')
  printf '%s' "$json" | sh "$HOOK" >/dev/null 2>&1
  got=$?
  if [ "$got" = "$2" ]; then
    printf 'ok   | %s\n' "$1"
  else
    printf 'FAIL | %s  (got exit=%s, want %s)\n' "$1" "$got" "$2"
    fails=$((fails + 1))
  fi
}

# --- compliant: anchor first, labels in the trailing block ---
check "compliant: anchor then A)/B)"            0 false "Context.
$A Which way?
A) first
B) second"
check "compliant: options paragraphs below anchor" 0 false "$A Big call?

some context

A) first

B) second"
check "compliant: three options A)/B)/C)"       0 false "$A Pick:
A) x
B) y
C) z"

# --- the Conv-002 loophole, now closed ---
check "loophole: stray A)/B) in prose, block clean" 2 false "Recap: cases A) and B) both passed earlier.
$A Shall I proceed?"
check "format: A)/B) listed ABOVE the anchor only"  2 false "A) first
B) second
$A A or B?"

# --- multiple anchors: only the LAST (the real ask) is assessed ---
check "multi-anchor: prose anchor w/ stray A)/B), ask clean" 2 false "As I noted $A earlier with A) and B) examples, here is the real one.
$A Shall I proceed?"
check "multi-anchor: prose anchor, real ask carries labels"  0 false "Recall the $A convention.
$A Which way?
A) first
B) second"

# --- near-misses in the block that must NOT count as labels ---
check "near-miss: lowercase a)/b) in block"     2 false "$A Which?
a) first
b) second"
check "near-miss: only A) in block, no B)"      2 false "$A Which?
A) lonely"
check "near-miss: period markers a. / 1."       2 false "$A Which?
1. first
a. second"
check "no labels at all in block"               2 false "$A Ready to go?"

# --- not-a-question / guard-off paths ---
check "no anchor: plain statement"              0 false "All done and committed."
check "no anchor: prose mentions A)/B)"         0 false "I weighed A) and B) and chose the first."
check "loop guard: active=true suppresses"      0 true  "$A no labels here"
check "fail-open: empty last_assistant_message" 0 false ""

echo "----"
if [ "$fails" -eq 0 ]; then
  echo "ALL PASS"
else
  echo "$fails FAILED"
  exit 1
fi
