# Hopper

Mid-work spin-offs captured as `- [ ]` lines — convenience capture, subject to scrutiny, not a
commitment. Ruled via `/r-hopper` (promote to a board row / do it now / drop) before `/r-end`. The
durable record of what was done is the conv record + the board, never a line left here.

## Open

- [ ] [SITE-ANALYTICS] GA page_view on client-side nav — ✅ **implemented Conv 031** (Layout.astro: `send_page_view:false` + manual `page_view` on `astro:page-load`). Verified in-browser against the local prod build: case → `/record` client-side nav fired exactly one page_view per page, correct `page_location`, no double-fire, `isClientSideNav:true`. Awaiting confirm + clear at `/r-hopper`.
- [ ] [SITE-ANALYTICS] GA is now **live on the production worker** (`fgw.fgorrie.workers.dev`, Conv 031 step 1); gated off on staging. Meaningful traffic only begins at the DNS cutover. Do an end-to-end GA realtime-hit confirmation (a page_view + the case→`/record` funnel) once real traffic flows.
- [ ] [SITE-GO-LIVE] step 1 — contact-form delivery ✅ **verified end-to-end Conv 031**: test POST → `{ok:true}` and the operator confirmed the email arrived at `fraser@frasergorrie.com`. Resolved — awaiting clear at `/r-hopper`.
- [ ] [SITE-PERF] The case-mockup **lightbox** (click-to-enlarge) still serves the original full-size asset on demand (redline.png ~352 KB); only the always-visible thumbnail was optimized Conv 031. Optional: generate a WebP full-size for the enlarged view. On-demand only → low priority.
- [ ] [SITE-GO-LIVE] The prod worker at `fgw.fgorrie.workers.dev` is live **AND crawlable** (robots allow-all, no `noindex`) before the domain cutover. Canonical/`og:url`/sitemap all point to `frasergorrie.com`, which mitigates duplicate-content/indexing, and the URL is unlinked/obscure. Watch: if the pre-cutover window runs long, consider host-gating `noindex` on the `*.workers.dev` host until cutover.
