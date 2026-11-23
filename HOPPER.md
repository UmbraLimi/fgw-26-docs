# Hopper

Mid-work spin-offs captured as `- [ ]` lines — convenience capture, subject to scrutiny, not a
commitment. Ruled via `/r-hopper` (promote to a board row / do it now / drop / carry) before `/r-end`.
The durable record of what was done is the conv record + the board, never a line left here.

## Open

- [ ] Record a `DEC` (Conv 055): the `[AGENT-DISCOVERY-WATCH]` now produces a **three-part output** each run — landscape snapshot + ban-aware findings-assessment + reconciliation into the `[AGENT-INITIATIVE]` standing board row (operator-directed, Conv 055); and `[AGENT-INITIATIVE]` is reframed from a one-shot deferral into the standing re-weighed-each-watch action plan. Distil at `/r-end`.
- [ ] Record a `DEC` (Conv 055): built `check-promises.sh` — a pure-text no-op-promise Stop hook that nudges on "don't-drop" self-reassurance phrasing (operator chose option A, the lightest shape, over a git-gated variant). Registered in `settings.json` as the 3rd Stop hook. Rationale: a prose reassurance routes nowhere; the phrase is a smell whether or not the item was routed.
- [ ] Tune `check-promises.sh` (Conv 055): it false-fired on **meta-discussion of itself** — quoting its own trigger idioms / citing CLAUDE.md's example phrases registers as a hit (fired on the very turn that documented the hook, and will recur whenever we discuss it). Decide: add a guard (skip quoted/example contexts — after `e.g.`/`fires on`/inside quotes) or accept it as a rare, tolerable false-fire. Living-regex tuning per the hook's own note.
- [ ] Optional (Conv 055): add a `check-promises.test.sh` to match the `check-ab-options` test pattern (operator's call — `check-routing.sh` ships without one). [Activation confirmed: the hook fired live on a Conv-055 turn, so the mid-session `settings.json` registration took effect with no reload — the earlier reload caveat is void.]
- [ ] Tune `check-ab-options.sh` (Conv 055): it false-fired on an **"or" inside a quoted heading** in a 👉👉👉 question that was actually a yes/no confirm, not an options fork. Will recur often in content work (headings/option text routinely contain "or"). Decide: have the matcher ignore "or" inside quotes/backticks, or accept it as a tolerable false-fire. Living matcher, same class as the `check-promises` quoting false-fire.
- [ ] Process catch (Conv 055 /r-start): I surfaced **two A/B questions in one turn** — the recommended-next-action fork *and* the continuation-mode pick — which breaks the standing "show a multi-question set, ask one at a time" rule. Operator flagged it ("I thought we already handled this"). Review: should the Step-6 continuation-mode standing notice be forbidden from sharing a turn with an options-bearing recommendation (it's meant to be a once-carried notice, not a competing A/B)? Candidate fix in `r-start` SKILL Step 6 and/or CLAUDE.md interaction model.

