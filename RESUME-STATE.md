**Conv:** ended · **Machine:** MacMiniM4Pro · **Branch:** docs: `main`, code: `main`

## Where we left off

Conv 031 made the site **launch-ready**. Everything remaining before the domain cutover got built,
deployed to prod + staging (kept in sync), and verified: `[SITE-SOCIAL]`, `[SITE-ANALYTICS]` (GA4
`G-EH3RJTF0VE`, production-only, + the view-transition page_view fix for the case→`/record` funnel +
engagement time), `[SITE-PERF]` (images 335/352 KB → ~2–32 KB via astro:assets `<Picture>`),
`[SITE-OG-IMAGE]` (wordmark share card), and `[CONTACT-TURNSTILE]` (spam-hardening, verified end-to-end).
The **production worker is live** at `fgw.fgorrie.workers.dev` as a reversible step 1 — the contact form
delivers email end-to-end through Turnstile. The board was pruned 392 → ~110 lines (done rows now drop to a
tags line, `DEC-031-7`). **The only remaining task on the whole project is the DNS cutover.**

## Next action

**`[SITE-GO-LIVE]` step 2 — the DNS cutover** (operator-gated, irreversible; `DEC-031-3` put it last on
purpose). It begins with the 🙋 4.2 ask (**where `frasergorrie.com` DNS lives today** + whether/when its
zone is in this Cloudflare account — the legacy site still answers the domain), needs an **explicit
go-ahead**, and has a 🔴 **tracked prerequisite: `frasergorrie.com` + `www.frasergorrie.com` must be in the
Turnstile widget's hostname list** or the live contact form `110200`-errors. Then the post-cutover live
checks on the real domain (GA realtime + case→`/record` funnel, contact form, apex/`www` HTTPS, `og:image`
previews). Staging + prod are currently in sync on the Turnstile build (`821eba8c` / `f86a3c72`).

## 🔬 Carried findings
_None._
