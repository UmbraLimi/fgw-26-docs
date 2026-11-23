# Hopper

Mid-work spin-offs captured as `- [ ]` lines — convenience capture, subject to scrutiny, not a
commitment. Ruled via `/r-hopper` (promote to a board row / do it now / drop / carry) before `/r-end`.
The durable record of what was done is the conv record + the board, never a line left here.

## Open

- [ ] `[GUIDE-PLANNING]` forward-link deferred (Conv 056, step-15 cross-linking): the 3-cornerstone pass calls for folding a forward-link to the future PLANNING guide into Steering's planning para (`DEC-045-3`), but **no planning guide file exists** (`src/content/guides/` has only the 3 cornerstones) — a live href would 404. Can't be built until the planning guide is created. Add it when `[GUIDE-PLANNING]` is built; the rest of step 15 proceeds without it.
- [ ] Blog/writing articles section — build out + re-enable (Conv 056, operator; guides-only launch decision). For the 3-guides launch we **fully suppress the blog articles section on `/guides/`** (the "Latest writing" stream) and launch guides-only. Building out real articles + re-revealing the `/writing/` stream is a **separate task later**. Covers: writing the first real article(s), un-suppressing the `/guides/` stream, revealing `/writing/`, and the `[BLOG-REDIRECT]` `/blog→/writing/` 301.
- [ ] `[PROD-DEPLOY-BAN]` reconcile for guides-only launch (Conv 056): the ban requires *"the first blog page AND all guide pages finalized"* before any prod deploy; launching guides-only means **no finalized first article exists**, so the "first blog page" clause must be amended (and a `DEC` recorded) or the fail-closed `assert-prod-deploy-allowed.mjs` will block the deploy. Belongs to the go-live sequence.
- [ ] FAQ → `/guides/` on-ramp at flip (Conv 056; step-15 `/faq/` piece, deferred while guides are dark): `faq.astro` renders answers as escaped plain text, so an inline link isn't possible in an answer — the on-ramp goes in the **bottom cross-link paragraph** (currently `/phases` + `/work`). Add when the guides go live, not while dark.
