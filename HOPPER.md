# Hopper

Mid-work spin-offs captured as `- [ ]` lines — convenience capture, subject to scrutiny, not a
commitment. Ruled via `/r-hopper` (promote to a board row / do it now / drop / carry) before `/r-end`.
The durable record of what was done is the conv record + the board, never a line left here.

## Open

- [ ] **Read the Trust guide as a rendered web page (next conv, operator)** — the operator will read the whole `is-your-ai-built-software-sound.md` as it renders (dev server / preview), top to bottom, for a final feel before further rulings.
- [ ] **Rule on images, attribution, and date-stamping for content (operator, Conv 040)** — decide how content pieces handle images, author attribution, and date stamps. Operator's steer: these are **mostly for Writing/blog articles, not the timeless guides** (guides are undated by design). Settle per content type.
- [ ] **[SITE-CONTENT-HOME] flip-live steps (Conv 039)** — when the first real cornerstone guide is approved, **set `CONTENT_HOME_LIVE = true`** and deploy. That single flag now drives everything: it reveals the nav + footer content-home links (gated `CONTENT_HOME_LIVE || DEV`, Conv 039), drops the `noindex`, and re-includes `/guides` + `/writing` in the sitemap — no per-file nav edits needed at flip. The old `/blog` → `/writing/` 301 decision is tracked by `[BLOG-REDIRECT]`. JSON-LD (`CreativeWork`) is authored with `[SITE-STRUCTURED-DATA]`.
