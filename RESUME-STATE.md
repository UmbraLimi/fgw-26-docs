**Conv:** ended · **Machine:** MacMiniM4Pro · **Branch:** docs: `main`, code: `main`

## Where we left off

Conv 017 was a page-by-page prose + UI refinement of the **home page** (operator-driven, iterative),
viewed on staging-via-dev only — **no deploy**. Shipped: a reworked hero (new positioning h1 "Custom
software, designed with you — kept on course by me." + a supporting deck + a two-paragraph narrative
under a "Where I come in" h2, `DEC-017-1`); a **site-wide footer em-dash footnote** that owns the AI
"tell" (tool-vs-work), with a circled-"1" marker in the home h1 that auto-opens it (`DEC-017-2`);
"44 years" → **"over 40 years"** on home (true 44 kept in `llms.txt`, `DEC-017-3`); and a **home-only
uniform section rhythm** (2.5rem, scoped `section-tight`/`band-tight` modifiers, `DEC-017-4`).
`[SITE-NARRATIVE]` stays content-complete, gated on client sign-off.

## Next action

Continue the **page-by-page prose/UI pass** on the next page the operator chooses (home is done for now).
When other pages are touched, reconcile two things the operator deferred per-page: (a) their prose/voice
to the new home messaging, and (b) the "44 vs over 40" figure (`about.astro` + its "1982" anchor,
`faq.astro`). No un-gated CC build is queued — the remaining ordered builds stay operator-gated
(`[SITE-PERF]` waits on the full image set; production waits on client sign-off).

⚠️ Production has **never been deployed** — all home changes this conv are dev/staging-visible only; they
do not exist live until `[SITE-GO-LIVE]` (Phase 4).

## 🔬 Carried findings
_None._
