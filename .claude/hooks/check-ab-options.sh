#!/bin/sh
# check-ab-options.sh — Stop hook (fgw, Conv 001).
#
# Enforces CLAUDE.md "Decisions → A/B": any turn that ends with a 👉👉👉 question must
# present labelled ASCII options (A) / B) [/ C) ...]) — permission asks included. If the
# 👉👉👉 anchor is present but no A)/B) labels are, the hook blocks the stop (exit 2) and
# feeds the lapse back to Claude to re-ask correctly.
#
# The 👉👉👉 anchor is the detection handle: CLAUDE.md "Interaction model" mandates that
# every question carries it and is the last thing in the turn — which makes the omission
# mechanically detectable. Rationale: DECISIONS.md DEC-001-1.
#
# Fails OPEN: any missing input (no jq, no transcript, no assistant text) exits 0 so a
# hook/infra problem never traps a turn.

input=$(cat)

# Loop guard: if a prior stop in this cycle was already blocked by a stop hook, let it
# pass. Guarantees at most one forced correction, so a stubborn case can never trap us.
active=$(printf '%s' "$input" | jq -r '.stop_hook_active // false' 2>/dev/null)
[ "$active" = "true" ] && exit 0

transcript=$(printf '%s' "$input" | jq -r '.transcript_path // empty' 2>/dev/null)
[ -z "$transcript" ] && exit 0
[ -f "$transcript" ] || exit 0

# Last assistant message object (one JSON object per JSONL line), then its text blocks.
last=$(jq -c 'select(.message.role == "assistant")' "$transcript" 2>/dev/null | tail -n1)
[ -z "$last" ] && exit 0
text=$(printf '%s' "$last" | jq -r '[.message.content[]? | select(.type == "text") | .text] | join("\n")' 2>/dev/null)
[ -z "$text" ] && exit 0

# No question anchor in the turn → nothing to enforce.
printf '%s' "$text" | grep -qF "👉👉👉" || exit 0

# Anchor present → require both an A) and a B) label (not preceded by a word char, so
# "plan A)" in prose does not count as an option label).
if printf '%s' "$text" | grep -qE '(^|[^A-Za-z0-9])A\)' \
   && printf '%s' "$text" | grep -qE '(^|[^A-Za-z0-9])B\)'; then
  exit 0
fi

echo "A/B GUARD: this turn ends with a 👉👉👉 question but presents no labelled A)/B) options. CLAUDE.md requires every question — permission asks included — to offer labelled ASCII options. Re-ask with A) / B) [/ C) ...] so the operator can answer by letter." >&2
exit 2
