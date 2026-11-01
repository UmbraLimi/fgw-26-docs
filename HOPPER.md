# Hopper

Mid-work spin-offs captured as `- [ ]` lines — convenience capture, subject to scrutiny, not a
commitment. Ruled via `/r-hopper` (promote to a board row / do it now / drop) before `/r-end`. The
durable record of what was done is the conv record + the board, never a line left here.

## Open

- [ ] Verify in the running product that clicking the home-page H1 em-dash anchor (`#em-dash-note`) auto-expands the collapsed footer `<details>` note — relies on browser `<details>` fragment-expansion (Chrome 120+/Safari 17+/FF 121+); older browsers land on the collapsed teaser (graceful). (Conv 017)
- [ ] Reconcile the experience-figure phrasing — home hero now reads "over 40 years" (Conv 017), but the exact computed `yearsExperience()` (=44) still shows on: `llms.txt.ts:37`, `about.astro:18` (+ the "1982" anchor), `faq.astro` `{YEARS}` fill. Fix per-page as we reach each page (operator, Conv 017). If all displays go static, revisit the fate of `yearsExperience()` + its DEC-016-2 eslint guard / vitest test.

