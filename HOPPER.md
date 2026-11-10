# Hopper

Mid-work spin-offs captured as `- [ ]` lines — convenience capture, subject to scrutiny, not a
commitment. Ruled via `/r-hopper` (promote to a board row / do it now / drop / carry) before `/r-end`.
The durable record of what was done is the conv record + the board, never a line left here.

## Open

- [ ] **[SITE-CONTENT-HOME] flip-live steps (Conv 039)** — when the first real cornerstone guide is approved, flip `CONTENT_HOME_LIVE` to `true`, add the hub to `Nav.astro` + `Footer.astro` (permanently this time — see the reversal item below), re-include `/guides` + `/blog` in the sitemap, then deploy. The `/blog` redirect is already dropped (tracked by `[BLOG-REDIRECT]`). JSON-LD (`CreativeWork`) is authored with `[SITE-STRUCTURED-DATA]`.
- [ ] 🔴 **Reverse the DEV-PREVIEW nav/footer links before `/r-end` (Conv 039)** — the "Guides" link added to `Nav.astro` and `Footer.astro` this conv is **dev-preview only** (both marked with a `DEV-PREVIEW` comment). The content home stays dark/off-nav until flip, so these must be reverted before the conv closes; **never stage `Nav.astro`/`Footer.astro` in a `/r-commit`** while the preview links stand. (Dropping the `/blog` redirect is intentional and stays — that's `[BLOG-REDIRECT]`, not reversed here.)

