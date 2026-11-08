**Conv:** ended · **Machine:** MacMiniM4Pro · **Branch:** docs: `main`, code: `main`

## Where we left off

Conv 032 took fgw-26 **live at frasergorrie.com** (DNS cutover done — apex custom domain + `www` route,
Google Workspace + Resend email preserved) and then fixed three post-launch bugs, all verified live: the
contact-form confirmation (Astro ClientRouter was intercepting the POST), the brown image-band
(`display:contents` percentage-height bug), and old-URL 301 redirects. A `deploy:staging` briefly stole the
live apex mid-conv (top-level routes leaked into the flattened staging config) — recovered within minutes
and guarded (`assert-worker.mjs` + `routes:[]` in `env.staging`). The Conv-007 critical path is **complete**;
the board's 🔥 Ordered is empty. Lighthouse home = 100/100/100/100.

## Next action

No launch work remains. The two **carried hopper items** — `Turnstile-hide` (switch widget to invisible
mode) and `HSTS` (enable deliberately) — surface at the next `/r-start`; rule/do them if you want further
polish, otherwise the site is in steady state. Both are low-priority (cosmetic / hardening). Standing
Unordered rows: `[CASE-RECORD-SIGNOFF]` (masking + restore guards) and `[SITE-TOOLS]` (parked). `/blog`→`/`
redirect is flagged provisional (`DEC-032-5`).

## 🔬 Carried findings
_None._
