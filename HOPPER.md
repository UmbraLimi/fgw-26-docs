# Hopper

Mid-work spin-offs captured as `- [ ]` lines — convenience capture, subject to scrutiny, not a
commitment. Ruled via `/r-hopper` (promote to a board row / do it now / drop / carry) before `/r-end`.
The durable record of what was done is the conv record + the board, never a line left here.

## Open

- [ ] **[SITE-CONTENT-HOME] flip-live steps (Conv 039)** — when the first real cornerstone guide is approved, flip `CONTENT_HOME_LIVE` to `true`, add the content-home links to `Nav.astro` + `Footer.astro` (permanently this time — see the reversal item below), re-include `/guides` + `/writing` in the sitemap, then deploy. The old `/blog` → `/writing/` 301 decision is tracked by `[BLOG-REDIRECT]`. JSON-LD (`CreativeWork`) is authored with `[SITE-STRUCTURED-DATA]`.
- [ ] 🔴 **Reverse the DEV-PREVIEW nav/footer changes before `/r-end` (Conv 039)** — dev-preview only (all marked with a `DEV-PREVIEW` comment), to be reverted before the conv closes AND **re-applied permanently with the Guides link at flip** (they belong together — the brand-text fix only makes sense once Guides is in the nav): (1) the content-home links — nav: **"Guides"** → `/guides/` (`Nav.astro`); footer: **"Guides"** → `/guides/` + **"Writing"** → `/writing/` (the articles-direct bypass) (`Footer.astro`); (2) the **brand-text responsive fix in `Nav.astro`** (wordmark wrapped in `.brand-text` + a scoped `@media (768-1023.98px)` hide, so the added Guides link doesn't collide with "Fraser Gorrie" in the 768-1024px band). The content home stays dark/off-nav until flip, so **never stage `Nav.astro`/`Footer.astro` in a `/r-commit`** while these stand. (Dropping the `/blog` redirect is intentional and stays — `[BLOG-REDIRECT]`, not reversed here.)

