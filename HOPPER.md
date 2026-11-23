# Hopper

Mid-work spin-offs captured as `- [ ]` lines — convenience capture, subject to scrutiny, not a
commitment. Ruled via `/r-hopper` (promote to a board row / do it now / drop / carry) before `/r-end`.
The durable record of what was done is the conv record + the board, never a line left here.

## Open

- [ ] Tune `check-ab-options.sh` (Conv 055): it false-fired on an **"or" inside a quoted heading** in a 👉👉👉 question that was actually a yes/no confirm, not an options fork. Will recur often in content work (headings/option text routinely contain "or"). Decide: have the matcher ignore "or" inside quotes/backticks, or accept it as a tolerable false-fire. Living matcher, same class as the `check-promises` quoting false-fire.
- [ ] Process catch (Conv 055 /r-start): I surfaced **two A/B questions in one turn** — the recommended-next-action fork *and* the continuation-mode pick — which breaks the standing "show a multi-question set, ask one at a time" rule. Operator flagged it ("I thought we already handled this"). Review: should the Step-6 continuation-mode standing notice be forbidden from sharing a turn with an options-bearing recommendation (it's meant to be a once-carried notice, not a competing A/B)? Candidate fix in `r-start` SKILL Step 6 and/or CLAUDE.md interaction model.

