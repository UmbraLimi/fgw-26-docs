#!/bin/sh
# check-promises.test.sh — deterministic tests for the no-op-promise Stop hook (fgw, Conv 055).
#
# Drives check-promises.sh with crafted `last_assistant_message` stdin and asserts the
# exit code (0 = allow stop, 2 = nudge). Run: sh check-promises.test.sh
# No network, no transcript, no CC — pure logic. Covers the "don't-drop" self-reassurance
# construction (fires), the routed/plain forms (pass), the loop guard, fail-open, near-misses
# that must NOT fire, and the one known false-fire accepted at Conv 055 (item 3 dropped).

HERE=$(dirname "$0")
HOOK="$HERE/check-promises.sh"
TMP=$(mktemp -d)
trap 'rm -rf "$TMP"' EXIT
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

# --- FIRE (exit 2): the "don't-drop" self-reassurance construction ---
check "fire: noting it so it isn't dropped"      2 false "Done. Noting it so it isn't dropped."
check "fire: so we don't lose it"                2 false "I'll make a note so we don't lose it."
check "fire: to make sure we don't forget"       2 false "Flagging it to make sure we don't forget."
check "fire: so it's not lost"                   2 false "Captured so it's not lost."
check "fire: to ensure nothing slips"            2 false "Logged it to ensure nothing slips."
check "fire: so that won't be missed"            2 false "Added so that won't be missed later."

# --- PASS (exit 0): routed/named-artifact + plain prose (no construction) ---
check "pass: names the concrete artifact"        0 false "Done. Captured in HOPPER.md as a - [ ] line."
check "pass: plain statement"                    0 false "All done and committed."
check "pass: bare 'dropped', no construction"    0 false "We dropped the feature last week."
check "pass: bare 'lose', no reassurance"        0 false "You could lose an afternoon to this."

# --- guard-off paths ---
check "loop guard: active=true suppresses"       0 true  "noting it so it isn't dropped"
check "fail-open: empty last_assistant_message"  0 false ""

# --- near-miss: the construction needs a PRONOUN subject; "so the ..." does NOT match ---
check "near-miss: 'so the reader...' passes"     0 false "Trim it so the reader doesn't lose the thread."
# --- known false-fire ACCEPTED at Conv 055 (item 3 dropped): content with a pronoun subject ---
check "known FP (accepted): 'so it doesn't lose'" 2 false "Keep it short so it doesn't lose the reader."

echo "----"
if [ "$fails" -eq 0 ]; then
  echo "ALL PASS"
else
  echo "$fails FAILED"
  exit 1
fi
