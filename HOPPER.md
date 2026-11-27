# Hopper

Mid-work spin-offs captured as `- [ ]` lines — convenience capture, subject to scrutiny, not a
commitment. Ruled via `/r-hopper` (promote to a board row / do it now / drop / carry) before `/r-end`.
The durable record of what was done is the conv record + the board, never a line left here.

## Open

- [ ] **Pending DEC to distill (Conv 061):** `check-promises.sh` Trigger 2 (close-deferral) gained an exclusion so a hopper-ruling turn that quotes an already-captured capture line no longer self-nudges — fires only when no "already-captured / ruling an existing item" marker is present. Verified in the running hook (4 cases). Process decision for `DECISIONS.md` at close.
- [ ] **Pending DEC to distill (Conv 061) — social post-stats reporting system.** New `stats:` frontmatter block per post dossier = machine-readable latest-snapshot (table source); **`/r-post-stats`** renders per-channel standalone `.html` reports into `.scratch/` (2-rows-per-post: Opening+Read band over a stats row; posts striped light-blue per pair + divider line; filename `<channel>_<most-recent-last_read>.html`); **`/r-post-stats-refresh`** re-reads live numbers via Chrome and writes the blocks. `## Outcomes` stays the dated-read narrative. Design decision for `DECISIONS.md` at close.
- [ ] **Wire the `stats:` block into `/r-post` (Conv 061).** New post dossiers should be scaffolded with an empty `stats:` stub (status: active + due from the channel horizon) at creation, so `/r-post-stats` never reports a post as "Missing stats" and `/r-post-stats-refresh` only fills values. Today a post with no `stats:` block is handled (refresh creates it), but creation-time scaffolding is cleaner. Small edit to `.claude/skills/r-post/SKILL.md` (+ maybe `reference/POST-CREATE.md`).
- [ ] **Pending DEC to distill (Conv 061) — GSC report-legibility governing principle (operator-set):** actively stifle every GSC-reportable artifact we *can* (via Google's own tools or our settings), so GSC's results read cleanly without per-item caveats; artifacts that only heal with time (e.g. old-path 301 "Page with redirect" ghosts) we let age out. First application: `/api/contact` 405 artifact → `robots.txt` `Disallow: /api/` deployed + GSC Validate Fix (Conv 061). Design/process decision for `DECISIONS.md` at close.
