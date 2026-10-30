# Hopper

Mid-work spin-offs captured as `- [ ]` lines — convenience capture, subject to scrutiny, not a
commitment. Ruled via `/r-hopper` (promote to a board row / do it now / drop) before `/r-end`. The
durable record of what was done is the conv record + the board, never a line left here.

## Open

- [ ] [SITE-SEO] deferred remainder: a 1200×630 `og:image` (branded social-share card) + wire it into
  `og:image`/`twitter:image` and bump `twitter:card` to `summary_large_image` in `Layout.astro`. Needs a
  design asset / operator call. (observed Conv 015)
- [ ] Staging indexability: the Conv 015 SEO assets are environment-agnostic — staging will serve
  `robots.txt` (allow all) + a sitemap + canonicals pointing at `frasergorrie.com`. Canonical→prod
  mitigates, but consider a staging-only `noindex`/robots-disallow so the staging domain isn't crawled on
  its own. A [SITE-GO-LIVE]/staging concern. (observed Conv 015)
- [ ] The Conv 014 block under `✅ Completed this conv` in `CURRENT-TASKS.md` wasn't swept at Conv 014's
  `/r-end` (its work is already in the Conv 014 record). Left there, Conv 015's `/r-end` will re-archive it
  under Conv 015. Decide: remove it now, or confirm `/r-end` handles de-dup. (observed Conv 015)
