#!/bin/sh
# check-ab-options.sh — Stop hook (fgw).
#
# Enforces CLAUDE.md "Decisions → A/B": a turn's trailing question block — from the 👉👉👉
# anchor to end of message — must present labelled ASCII options (A) / B) [/ C) ...]). The
# anchor HEADS the question block; the options follow it. Only that block is assessed, so a
# stray "A)"/"B)" in earlier prose no longer satisfies the guard (the Conv-002 loophole:
# the check used to scan the whole message). If the block lacks the labels, the hook blocks
# the stop (exit 2) and feeds the lapse back to Claude to re-ask correctly.
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

# No anchor → no question block → nothing to enforce.
case "$text" in
  *"$anchor"*) ;;
  *) exit 0 ;;
esac

# Isolate the ask: everything after the LAST anchor. CLAUDE.md puts the question (and its
# anchor) last in the turn, so the final 👉👉👉 is the real ask; stripping the longest
# prefix (##) skips any earlier 👉👉👉 merely mentioned in lead-up prose. POSIX-only, no
# awk/multibyte-regex dependency.
block=${text##*"$anchor"}

# The question block must carry both an A) and a B) label (label not preceded by a word
# char, so "plan A)" in running prose does not count as an option label).
if printf '%s' "$block" | grep -qE '(^|[^A-Za-z0-9])A\)' \
   && printf '%s' "$block" | grep -qE '(^|[^A-Za-z0-9])B\)'; then
  exit 0
fi

echo "A/B GUARD: this turn's 👉👉👉 question block presents no labelled A)/B) options. CLAUDE.md requires every question — permission asks included — to offer labelled ASCII options in the trailing question block (the 👉👉👉 anchor first, then A) / B) [/ C) ...]). Re-ask so the operator can answer by letter." >&2
exit 2
