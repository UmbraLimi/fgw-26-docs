#!/bin/sh
# check-routing.sh — Stop hook (fgw). Built Conv 046; reworked Conv 047 (DEC-047-2).
#
# ROLE (Conv 047): a LAPSE-CATCHER, not a verifier. The hook cannot confirm a claimed
# route actually reached a durable file, so verification is the OPERATOR's job — they
# read `git` directly. The hook's one job: whenever a turn uses a surfacing/routing
# word, make sure it also carries the self-signal line the operator scans ("🔎 Review:").
# Word present + line present -> Claude complied, allow. Word present + line absent ->
# Claude forgot, nudge once.
#
# GO-LIST (the trigger words — a LIVING list; DEC-047-2 expects us to add words and
# retire noisy single ones as experience shows what the operator needs to see). Edit
# the one grep below to tune it. Case-insensitive. 5 forms (Conv 051 retired
# raised/raising + flagged/flagging — too noisy in ordinary guide content, Conv 050
# false-fired 3×; the present-tense bases route/surface are also excluded): the -ing/-ed
# forms track the act of having routed/surfaced something:
#     routing routed | surfaced surfacing | disposition
# Word-boundaried (\b) so "route" / "surface" don't false-hit.
#
# SELF-SIGNAL MARKER: the review line Claude appends by CLAUDE.md rule, keyed on the
# literal token "🔎 Review:". There is NO git check any more — the old dirty-board
# allow-path ("stop list") is gone; the operator does the file review.
#
# Turn text comes from `last_assistant_message` on stdin (race-free). Loop guard: one
# nudge per stop cycle. Fails OPEN on any missing input (no jq / no message / etc.).

input=$(cat)

# Loop guard: at most one nudge per stop cycle.
active=$(printf '%s' "$input" | jq -r '.stop_hook_active // false' 2>/dev/null)
[ "$active" = "true" ] && exit 0

# Claude's final response text, straight from the Stop input.
text=$(printf '%s' "$input" | jq -r '.last_assistant_message // empty' 2>/dev/null)
[ -z "$text" ] && exit 0

# GO-LIST present? (case-insensitive; tune this single line to add/retire words.)
printf '%s' "$text" \
  | grep -qiE '\b(rout(ing|ed)|surfac(ed|ing)|disposition)\b' \
  || exit 0

# Self-signal review line present? Then Claude complied — allow.
printf '%s' "$text" | grep -qF '🔎 Review:' && exit 0

echo "ROUTING NUDGE: this turn uses a go-list surfacing/routing word (routing/routed/surfaced/surfacing/disposition) but carries no \"🔎 Review:\" line. CLAUDE.md requires one: end the turn with a compact '🔎 Review: words=[…]; changed files=[git status --short, or none] — please review.' line so the operator can check the claim against the actual diff. Add that line and re-stop. (The go-list is a living list — if this word is just noise here, note it for retiring.)" >&2
exit 2
