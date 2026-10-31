# Hopper

Mid-work spin-offs captured as `- [ ]` lines — convenience capture, subject to scrutiny, not a
commitment. Ruled via `/r-hopper` (promote to a board row / do it now / drop) before `/r-end`. The
durable record of what was done is the conv record + the board, never a line left here.

## Open

- [ ] Staging-noindex (built Conv 015) only takes effect on the **next staging redeploy** — current live
  `fgw-staging.fgorrie.workers.dev` still serves the old allow-all `robots.txt` and no `noindex` until then.
  Part of the same HEAD-only batch as [SITE-SEO]/[SITE-CROSSLINK]; redeploy staging to activate. (observed Conv 015)
