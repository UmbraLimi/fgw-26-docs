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
# TRIGGER (a LIVING regex — tune the single grep below as experience shows false-fires).
# Case-insensitive. Matches a reassurance LEAD-IN ("so <pron>" / "to make sure" /
# "to ensure") followed within the same sentence ([^.]*, i.e. not crossing a period) by
# a NEGATION then a LOSS verb (drop / lost / lose / forgot / miss / slip).
# Needs a PRONOUN subject after "so" (so it/this/that/they/we/nothing), so "so the
# reader doesn't lose the thread" does NOT match; a genuine false-fire needs the
# pronoun, e.g. "so it doesn't lose the reader". Acceptable as a lapse-catcher; narrow
# if it gets noisy.
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

# No-op-promise construction present? (case-insensitive; tune this single line.)
printf '%s' "$text" \
  | grep -qiE "(so (it|this|that|they|we|nothing)|to make sure|to ensure)[^.]*(isn'?t|does ?n'?t|do ?n'?t|wo ?n'?t|will not|is not|does not|not|never)[^.]*(drop|lost|lose|forget|forgot|miss|slip)" \
  || exit 0

echo "NO-OP PROMISE NUDGE: this turn contains a \"don't-drop\" self-reassurance (e.g. \"noting it so it isn't dropped\", \"so it's not lost\", \"to make sure we don't forget\"). Per CLAUDE.md that phrasing is a signal you are about to drop something — a prose reassurance routes NOWHERE. If you DID route it, delete the reassurance and name the concrete artifact instead (e.g. \"captured in HOPPER.md as a - [ ]\"). If you did NOT, add the HOPPER.md \`- [ ]\` line / CURRENT-TASKS.md row now. Then re-stop. (The trigger is a living regex — if this fired on ordinary content, note it for tuning.)" >&2
exit 2
