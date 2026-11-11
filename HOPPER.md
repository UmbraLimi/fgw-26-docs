# Hopper

Mid-work spin-offs captured as `- [ ]` lines — convenience capture, subject to scrutiny, not a
commitment. Ruled via `/r-hopper` (promote to a board row / do it now / drop / carry) before `/r-end`.
The durable record of what was done is the conv record + the board, never a line left here.

## Open

- [ ] **Record editing working-mode as a DEC (Conv 040)** — operator direction (Conv 040): when applying a `P#S#` content edit, CC is free to normalize and improve the prose while keeping the voice (consult VOICE/PERSONA); the operator will say "verbatim" when a literal replacement is wanted. Also (Conv 040): as content is edited, CC notices good turns of phrase / deliberate voice departures, surfaces them (inline ask, or a `VOICE-CANDIDATE` hopper line when mid-flow), and adds approved ones to `VOICE.md`. Also (Conv 040): CC watches for **audience-drift** (teaching coders/builders inside buyer copy), reframes to the buyer, and preserves the coder-angled material in `_cc/for-builders-tidbits.md` (new capture doc toward a rare "for builders" article) rather than dropping it; persona propensity recorded in `PERSONA.md`. Capture all of this as a `DEC-040-N` at /r-end.
- [ ] **Record content coordinate-view tool as a DEC (Conv 040)** — `scripts/number-content.mjs` in `fgw-26` (built Conv 040) prints a guide/article with positional `P#`/`S#` addresses so the operator can point CC at an exact edit site ("change P2S4 to read ..."); numbers are computed on demand, never stored in content. Capture the tool + the `P#S#` edit-convention as a `DEC-040-N` at /r-end. New CC-authored file to commit: `fgw-26 scripts/number-content.mjs`.
- [ ] **[SITE-CONTENT-HOME] flip-live steps (Conv 039)** — when the first real cornerstone guide is approved, **set `CONTENT_HOME_LIVE = true`** and deploy. That single flag now drives everything: it reveals the nav + footer content-home links (gated `CONTENT_HOME_LIVE || DEV`, Conv 039), drops the `noindex`, and re-includes `/guides` + `/writing` in the sitemap — no per-file nav edits needed at flip. The old `/blog` → `/writing/` 301 decision is tracked by `[BLOG-REDIRECT]`. JSON-LD (`CreativeWork`) is authored with `[SITE-STRUCTURED-DATA]`.

