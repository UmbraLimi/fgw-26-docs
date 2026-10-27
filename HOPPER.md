# Hopper

Mid-work spin-offs captured as `- [ ]` lines — convenience capture, subject to scrutiny, not a
commitment. Ruled via `/r-hopper` (promote to a board row / do now / drop) before `/r-end`. The
durable record of what was done is the conv record + the board, never a line left here.

## Open

- [ ] **Caveat (Conv 008, `DEC-008-1`):** with no `.dev.vars.staging`, `wrangler dev --env staging` will read `.env.staging` via wrangler's `.env` fallback (`CLOUDFLARE_LOAD_DEV_VARS_FROM_DOT_ENV` defaults true) and inject `CLOUDFLARE_ENV` as a runtime `secret_text` binding — a build selector leaking into runtime. Not yet reproduced in `wrangler dev`; verify, then decide (e.g. ship a minimal `.dev.vars` to shield the fallback, or ignore as harmless).
