#!/bin/sh
# check-routing.sh — Stop hook (fgw). Built Conv 046.
#
# Enforces CLAUDE.md "Surfacing & guards": a NAMED ROUTE must be backed by the concrete
# artifact edit it claims, landed THIS SAME TURN. The scar (Conv 046): a live, unresolved
# caveat (verify-at-next-launch) was labelled "surfaced inline — disposition: no durable
# record needed" and routed NOWHERE — prose that sounds like surfacing while nothing moved.
# This hook gives that rule teeth, as check-ab-options.sh does for the A/B rule.
#
# TRIGGER — deliberate, low-noise. The bare words route / routing / routed are NOT triggers:
# they saturate ordinary explanatory prose (a turn discussing the rule would fire every time),
# exactly the reason check-ab-options keys on the 👉👉👉 anchor and not on any question. The
# trigger is instead the DISPOSITION VOCABULARY from CLAUDE.md's "Never say flag" rule — the
# phrases written only when actually dispositioning a finding:
#     "surfaced inline"  |  "disposition:"  |  "no action, visible only"
# Absent all of them → nothing to enforce.
#
# CHECK — when a disposition phrase is present, a routing claim was made, so a routing edit
# should be pending: HOPPER.md or CURRENT-TASKS.md dirty in the docs working tree. Either one
# dirty → the claim is backed → allow. Both clean → the claim moved nothing → block (exit 2)
# and feed the lapse back so Claude routes it or restates it honestly.
#
# Turn text comes from the `last_assistant_message` field on stdin — NOT the transcript, which
# races (the lesson check-ab-options records from Conv 002).
#
# HEURISTIC LIMITS (accepted by the operator, Conv 046, like the A/B guard's occasional
# over-fire):
#   * UNDER-fires if HOPPER/CURRENT-TASKS were already dirty from an earlier turn — a fresh
#     claim with no NEW edit still passes. (/r-commit cleans them, restoring teeth between
#     commits.)
#   * OVER-fires on a disposition that is legitimately "mitigated this same turn" or
#     "visible only" (no edit expected), and when merely EXPLAINING the rule. On a false
#     positive, say so; the loop guard guarantees the next stop passes.
#
# Fails OPEN: any missing input (no jq, no message, no git, no CLAUDE_PROJECT_DIR) exits 0 so
# a hook/infra problem never traps a turn.

input=$(cat)

# Loop guard: at most one forced correction per stop cycle (a stubborn case never traps us).
active=$(printf '%s' "$input" | jq -r '.stop_hook_active // false' 2>/dev/null)
[ "$active" = "true" ] && exit 0

# Claude's final response text, straight from the Stop hook input (race-free).
text=$(printf '%s' "$input" | jq -r '.last_assistant_message // empty' 2>/dev/null)
[ -z "$text" ] && exit 0

# A disposition claim present? (case-insensitive; matches inside **bold** or mid-line.)
printf '%s' "$text" | grep -qiE 'surfaced inline|disposition:|no action, visible only' || exit 0

# A routing claim was made. Is a routing edit pending in the docs working tree?
dir=${CLAUDE_PROJECT_DIR:-.}
status=$(git -C "$dir" status --porcelain -- HOPPER.md CURRENT-TASKS.md 2>/dev/null) || exit 0
[ -n "$status" ] && exit 0   # HOPPER.md or CURRENT-TASKS.md dirty → claim is backed → allow.

echo "ROUTING GUARD: this turn uses routing/disposition vocabulary (\"surfaced inline\" / \"disposition:\" / \"no action, visible only\") but no edit to HOPPER.md or CURRENT-TASKS.md is pending in the working tree — the named route moved nothing. CLAUDE.md: a live/unresolved caveat must land as a \`- [ ]\` hopper line (or a board row) THIS SAME TURN; \"surfaced inline\" is not a valid disposition for one. Either route it now (edit HOPPER.md / CURRENT-TASKS.md) and re-stop, or — if the caveat was genuinely mitigated this turn or is visible-only (a false positive) — restate it as resolved; the next stop will pass." >&2
exit 2
