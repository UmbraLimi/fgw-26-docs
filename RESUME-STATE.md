**Conv:** ended · **Machine:** MacMiniM4Pro · **Branch:** docs: `main`, code: `main`

## Where we left off

Conv 034 shipped **`[SITE-HEADER-TITLE]`**: the page title reveals in the sticky header once the H1
scrolls off — **inline beside the brand at ≥1024px**, a **full-width second row inside the header below
1024px** (keeps the horizontal nav down to 768px), **eyebrow styling** (uppercase ember), left-aligned;
home omits it. Also recorded the **Gabriel masking exception** (`DEC-034-1`; `[CASE-RECORD-SIGNOFF]`
guard rewritten to current-state) and removed the orphaned `.sample-badge` CSS. All committed in-repo.

🔴 **Still NOT deployed.** Neither the Conv-034 header-title work nor the Conv-033 testimonial /
`/llms.txt` / anchor fixes are live — the prod deploy has been auto-mode-blocked since Conv 033. The
live site shows none of it.

## Next action

🔴 **Deploy** to make Conv-033 **and** Conv-034 changes live: `npm run deploy` from `fgw-26`. It is
auto-mode-blocked, so the operator runs it (or disables auto-mode) — don't retry it under auto-mode.
Then at `/r-start` → `/r-hopper` for the one carried item: **secondary-button visibility** (a global
`Button variant="secondary"` token/styling fix — faint in both themes; seen on the home testimonial
band, phase CTAs, and case-study transcript buttons). Open board rows: `[SITE-HSTS]` (low-priority
hardening), `[SITE-TOOLS]` (parked).

## 🔬 Carried findings
_None._
