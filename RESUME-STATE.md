**Conv:** ended · **Machine:** MacMiniM4Pro · **Branch:** docs: `main`, code: `main`

## Where we left off

Conv 033 published **Gabriel Rymberg's** real, signed-off testimonial: a short **mask-safe** pull-quote on
home deep-linking (`#gabriel-rymberg`) to the full named quote on `/testimonials` (AI-era section restored,
`showAiTestimonials=true`). It runs under a **testimonial-only masking exception** — names Gabriel + the
Center for Unity (he cleared it), but the `translation-platform` case stays de-identified, no case-study
link sits on it, and the target language is never named. Also done: Turnstile → `interaction-only`
(**deployed**), robots.txt made single-source by disabling Cloudflare **Bot Preference Sync** (verified
live; `Google-Extended` allow restored), `/llms.txt` trailing-slash fix, a `scroll-padding-top` anchor fix,
and the `/testimonials` lede de-identification wording.

🔴 **Committed but NOT deployed.** Everything except the Turnstile change is in the repo (two Conv-033
commits + this close) but **not live** — the prod deploy was auto-mode-blocked. The live site still shows
the pre-testimonial state (plus the already-deployed Turnstile hide).

## Next action

🔴 **Deploy** to make the testimonial / llms / anchor fixes live: `npm run deploy` from `fgw-26` — it is
auto-mode-blocked, so the operator runs it (or disables auto-mode). Then at `/r-start` → `/r-hopper`, rule
the **3 carried hopper items**: (1) **record the masking exception** — write the `DEC` + rewrite the
`[CASE-RECORD-SIGNOFF]` guard (which currently carries only a ⚠️ Conv-033 pointer, not the full rewrite);
(2) **secondary-button visibility** (faint in both modes — global fix); (3) **`.sample-badge` CSS cleanup**.
Open board rows: `[SITE-HSTS]` (low-priority hardening) and `[SITE-HEADER-TITLE]` (page loses its title once
the H1 scrolls off — site-wide UX, deferred here for a fresh pass).

## 🔬 Carried findings
_None._
