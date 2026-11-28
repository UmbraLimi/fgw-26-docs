#!/bin/sh
# check-promises.sh — Stop hook (fgw). Built Conv 055 (DEC at /r-end).
#
# ROLE: a NO-OP-PROMISE catcher. CLAUDE.md names a class of hollow reassurance —
# "noting it so it isn't dropped", "so it's not lost", "to make sure we don't forget"
# — as a *signal Claude is about to drop something*: a prose reassurance routes
# nowhere. This hook fires on that self-reassurance construction and nudges Claude to
# either (a) delete the reassurance and name the concrete artifact (a HOPPER.md
# `- [ ]` / a CURRENT-TASKS.md row), or (b) actually route it now.
#
# WHY PURE TEXT (no git check): unlike check-routing.sh, there is NO allow-path. The
# phrase is a smell whether or not Claude routed the item — if routed, the artifact is
# the proof and the prose reassurance is redundant (CLAUDE.md: name where it went, don't
# gesture); if not routed, it is the no-op. So firing on the phrase every time is the
# intended behaviour; no dirty-board / git state is consulted. (Operator chose this
# "lightest" shape, Conv 055, option A, over a git-gated variant.)
#
# TRIGGER 1 (a LIVING regex — tune the single grep below as experience shows false-fires).
# Case-insensitive. Matches a reassurance LEAD-IN ("so <pron>" / "to make sure" /
# "to ensure") followed within the same sentence ([^.]*, i.e. not crossing a period) by
# a NEGATION then a LOSS verb (drop / lost / lose / forgot / miss / slip).
# Needs a PRONOUN subject after "so" (so it/this/that/they/we/nothing), so "so the
# reader doesn't lose the thread" does NOT match; a genuine false-fire needs the
# pronoun, e.g. "so it doesn't lose the reader". Acceptable as a lapse-catcher; narrow
# if it gets noisy.
#
# TRIGGER 2 — CLOSE-DEFERRAL (added Conv 058, operator). The phrase "at /r-end"
# (optional slash: "at r-end") in a turn is the shorthand no-op promise this session
# kept tripping on — "DEC at /r-end", "I'll record it at /r-end" — deferring a concrete
# item to the close instead of routing it NOW. Per CLAUDE.md the hopper/board is the
# only durable home; the close distills what's already captured, it is not a catch-all
# for prose promises. Fires on the literal phrase (case-insensitive). Conv 062: a
# backtick-tolerant variant (match `/r-end` in backticks/quotes) was tried and REVERTED —
# `/r-end` is habitually backticked in BOTH real no-op promises AND plain descriptive
# mentions, so matching the backticked form added descriptive-mention NOISE with no clean
# signal (operator). Kept at the bare "at /?r-end"; do not re-add backtick tolerance.
# LIVING regex: a descriptive process reference ("the hopper is ruled at /r-end") will
# also fire — tune with an exclusion if that proves noisy. Separate branch so each trigger
# tunes alone.
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

# Trigger 1 — no-op-promise self-reassurance construction (case-insensitive; tune this line).
if printf '%s' "$text" \
  | grep -qiE "(so (it|this|that|they|we|nothing)|to make sure|to ensure)[^.]*(isn'?t|does ?n'?t|do ?n'?t|wo ?n'?t|will not|is not|does not|not|never)[^.]*(drop|lost|lose|forget|forgot|miss|slip)"; then
  echo "NO-OP PROMISE NUDGE: this turn contains a \"don't-drop\" self-reassurance (e.g. \"noting it so it isn't dropped\", \"so it's not lost\", \"to make sure we don't forget\"). Per CLAUDE.md that phrasing is a signal you are about to drop something — a prose reassurance routes NOWHERE. If you DID route it, delete the reassurance and name the concrete artifact instead (e.g. \"captured in HOPPER.md as a - [ ]\"). If you did NOT, add the HOPPER.md \`- [ ]\` line / CURRENT-TASKS.md row now. Then re-stop. (The trigger is a living regex — if this fired on ordinary content, note it for tuning.)" >&2
  exit 2
fi

# Trigger 2 — close-deferral phrase "at /r-end" (added Conv 058, operator; case-insensitive).
# EXCLUSION (added Conv 061, DEC at close): a /r-hopper ruling of an already-captured
# capture line necessarily QUOTES the close-deferral wording, which is a reference to a
# durable hopper item (already routed), not a fresh prose promise. So skip the nudge when
# the same turn also carries an "already-captured / ruling an existing item" marker. A
# genuine no-op promise ("DEC at /r-end") carries no such marker, so it still fires.
# (Living regex — narrow the marker set if a real promise ever slips past.)
if printf '%s' "$text" | grep -qiE "at /?r-end" \
   && ! printf '%s' "$text" | grep -qiE "(already (captured|routed|a durable|in the hopper|a hopper line))|capture line|rul(e|ing) an existing"; then
  echo "CLOSE-DEFERRAL NUDGE: this turn defers something to the close with the phrase \"at /r-end\" (e.g. \"DEC at /r-end\", \"I'll record it at /r-end\"). Per CLAUDE.md that is a no-op promise — the close distills what is ALREADY captured in a durable artifact; it is not where a prose promise gets honoured. Route the item NOW: add the HOPPER.md \`- [ ]\` line (a pending DEC to distill, a task) or the CURRENT-TASKS.md row, then name that artifact instead of the phrase. Then re-stop. (Living regex — if this fired on a purely descriptive mention, note it for tuning.)" >&2
  exit 2
fi

exit 0
