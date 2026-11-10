# Hopper

Mid-work spin-offs captured as `- [ ]` lines — convenience capture, subject to scrutiny, not a
commitment. Ruled via `/r-hopper` (promote to a board row / do it now / drop / carry) before `/r-end`.
The durable record of what was done is the conv record + the board, never a line left here.

## Open

- [ ] **[SITE-CONTENT-HOME] flip-live steps (Conv 039)** — when the first real cornerstone guide is approved, flip `CONTENT_HOME_LIVE` to `true`, add the hub to `Nav.astro`, **remove the provisional `'/blog': '/'` redirect in `astro.config.mjs`** (confirmed Conv 039: that redirect *shadows the blog index route entirely* — `/blog/` emits no page in prod or `astro dev` while it stands; removing it is required for the blog to exist at all, not just to avoid a double-hop), re-include `/guides` + `/blog` in the sitemap, then deploy. JSON-LD (`CreativeWork`) is authored with `[SITE-STRUCTURED-DATA]`.

