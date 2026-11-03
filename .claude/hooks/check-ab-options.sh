#!/bin/sh
# check-ab-options.sh — Stop hook (fgw).
#
# Enforces CLAUDE.md "Decisions → A/B": a turn's trailing question block — from the 👉👉👉
# anchor to end of message — must present labelled ASCII options (A) / B) [/ C) ...]) WHEN
# the ask offers options. The anchor HEADS the question block (it must BEGIN A LINE — the
# emoji quoted mid-sentence in prose is not an ask, DEC-005-1); the options follow it. A
# purely open-ended question (no "or" fork) carries the anchor alone and needs no labels
# (DEC-021-4, Conv 021). Only that block is assessed, so a stray "A)"/"B)" in earlier prose
# no longer satisfies the guard (the Conv-002 loophole: the check used to scan the whole
# message). If an options-bearing block lacks the labels, the hook blocks the stop (exit 2)
# and feeds the lapse back to Claude to re-ask correctly.
#
# Turn text comes from the `last_assistant_message` field CC passes on stdin — NOT the
# transcript, which is written asynchronously and races (a `tail -n1` can read a prior
# thinking/tool_use record or a stale earlier turn; that was the original guard's failure,
# diagnosed Conv 002). Rationale: DECISIONS.md DEC-001-1 and its Conv-002 successor.
#
# Fails OPEN: any missing input (no jq, no last_assistant_message) exits 0 so a
# hook/infra problem never traps a turn.

input=$(cat)

# Loop guard: if a prior stop in this cycle was already blocked, let it pass. Guarantees at
# most one forced correction, so a stubborn case can never trap us.
active=$(printf '%s' "$input" | jq -r '.stop_hook_active // false' 2>/dev/null)
[ "$active" = "true" ] && exit 0

# Claude's final response text, straight from the Stop hook input (race-free).
text=$(printf '%s' "$input" | jq -r '.last_assistant_message // empty' 2>/dev/null)
[ -z "$text" ] && exit 0

# The 👉👉👉 anchor, built from its bytes so matching never depends on locale/awk.
anchor=$(printf '\xf0\x9f\x91\x89\xf0\x9f\x91\x89\xf0\x9f\x91\x89')

# Fast path: the emoji appears nowhere → no question → nothing to enforce.
case "$text" in
  *"$anchor"*) ;;
  *) exit 0 ;;
esac

# Isolate the ask. The anchor counts only when it HEADS A LINE — a real question is written
# "👉👉👉 …" at the start of a line; the same emoji quoted mid-sentence in prose is not an
# ask. Walk the lines, keeping everything from the LAST line that BEGINS with the anchor to
# end of turn — that span is the question block. (DEC-005-1, Conv 005: a non-question turn
# that merely quoted 👉👉👉 in prose was wrongly blocked, because the old `text##*anchor`
# split treated a mid-line mention as the ask.) POSIX-only, byte-safe match, no awk.
found=0
block=""
while IFS= read -r line || [ -n "$line" ]; do
  case "$line" in
    "$anchor"*) found=1; block=$line ;;
    *) [ "$found" = 1 ] && block="$block
$line" ;;
  esac
done <<EOF
$text
EOF

# Anchor present only mid-line (prose mention) → no real ask → nothing to enforce.
[ "$found" = 0 ] && exit 0

# Good case: the ask already carries labelled options (both A) and B)) → allow. The label is
# not preceded by a word char, so "plan A)" in running prose does not count as a label.
if printf '%s' "$block" | grep -qE '(^|[^A-Za-z0-9])A\)' \
   && printf '%s' "$block" | grep -qE '(^|[^A-Za-z0-9])B\)'; then
  exit 0
fi

# No labels. Labels are required only when the ask OFFERS options — heuristic (operator,
# Conv 021, DEC-021-4): an options-bearing ask carries a standalone "or" fork. A bare
# open-ended question has none and needs no labels, so it passes here.
if ! printf '%s' "$block" | grep -qiE '(^|[^A-Za-z])or([^A-Za-z]|$)'; then
  exit 0
fi

echo "A/B GUARD: this turn's 👉👉👉 question OFFERS options (an \"or\" fork) but presents no labelled A)/B) options. CLAUDE.md requires an options-bearing ask to carry labelled ASCII options in the trailing question block (the 👉👉👉 anchor first, then A) / B) [/ C) ...]). A purely open-ended question needs none; this one offers a choice, so re-ask with labels so the operator can answer by letter." >&2
exit 2
