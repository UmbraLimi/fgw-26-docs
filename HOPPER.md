# Hopper

Mid-work spin-offs captured as `- [ ]` lines — convenience capture, subject to scrutiny, not a
commitment. Ruled via `/r-hopper` (promote to a board row / do it now / drop) before `/r-end`. The
durable record of what was done is the conv record + the board, never a line left here.

## Open

- [ ] [SITE-ANALYTICS] GA page_view on client-side nav — ✅ **implemented Conv 031** (Layout.astro: `send_page_view:false` + manual `page_view` on `astro:page-load`). Verified in-browser against the local prod build: case → `/record` client-side nav fired exactly one page_view per page, correct `page_location`, no double-fire, `isClientSideNav:true`. Awaiting confirm + clear at `/r-hopper`.
- [ ] [SITE-ANALYTICS] GA fires **production-only** (gated off on staging in `Layout.astro`). No data reaches GA until `[SITE-GO-LIVE]` deploys production — do an end-to-end GA realtime-hit confirmation at go-live.
