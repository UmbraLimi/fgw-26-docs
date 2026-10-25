# Hopper

Mid-work spin-offs captured as `- [ ]` lines — convenience capture, subject to scrutiny, not a
commitment. Ruled via `/r-hopper` (promote to a board row / do now / drop) before `/r-end`. The
durable record of what was done is the conv record + the board, never a line left here.

## Open

- [ ] Fix the repo-state precompute in `r-start` SKILL.md (the `!` repo-state `for`-loop command): its inner `awk '{print "ahead "$1" · behind "$2}'` has `$1`/`$2` shell-expanded (`$1` → the loop's `for`), so awk errors out and every repo falls through to the `NO UPSTREAM` fallback — masking real ahead/behind. Needs `$1`/`$2` escaped (or awk rewritten) so quoting survives skill-command execution. (surfaced Conv 003)
