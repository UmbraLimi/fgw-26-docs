# Hopper

Mid-work spin-offs captured as `- [ ]` lines — convenience capture, subject to scrutiny, not a
commitment. Ruled via `/r-hopper` (promote to a board row / do it now / drop / carry) before `/r-end`.
The durable record of what was done is the conv record + the board, never a line left here.

## Open

- [ ] Guide/article animal art (O'Reilly-inspired line/tonal art, Conv 042): proof-of-concept ongoing. Pipeline PROVEN (ImageMagick + potrace/autotrace installed; crush→blur→trace tonal cutoffs→stroke). Pure stroked line art themes free via `currentColor` (light/dark proven). Subject iterations: dragonfly head (too complex) → pimpleback mussel (pustules fight the airy look). Downstream: add image field to `guides` schema, optional colophon block, provenance ledger (below).
- [ ] Image-provenance ledger (Conv 042, operator-requested): JSON collection (committed, e.g. `src/data/image-provenance.json`) keyed by `id`, referenced from content frontmatter; records source/license/credit/accessed-date + the manipulation chain. Schema proposal pending operator ruling. Strawman at `.scratch/img-proof/provenance.json`. Backfill to existing pages = separate later decision ("probably").
- [ ] Grey-fill rendering (Conv 042) loses the free `currentColor` light/dark theming — needs a per-theme tonal ramp AND vectorising the fills (multi-level trace). Only live if the filled-tonal direction is chosen over pure line art.

