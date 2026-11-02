**Conv:** ended · **Machine:** MacMiniM4Pro · **Branch:** docs: `main`, code: `main`

## Where we left off

Conv 018 was an operator-driven, page-by-page prose/UI pass on the **home page** (operator declared it
done), deployed to staging at the end. Shipped: the four-step build-flow chart reworded (multi-session AI
work is the key idea); the "Judgment in practice" band re-led as a question with three conceptual
"It happens in…" cards on a new `scales` icon (`DEC-018-1`); a lead-in for "What I do"; "Find your phase"
reworded so progression past phase one reads as not guaranteed (`DEC-018-2`); "I'm Fraser Gorrie" → "I'm
Fraser"; and a new "Recent testimonials" home band sharing `src/data/testimonials.json`, SAMPLE-badged,
attributions masked (`DEC-018-3`). Live on `fgw-staging.fgorrie.workers.dev`. `[SITE-NARRATIVE]` stays
content-complete, gated on client sign-off.

## Next action

Continue the **page-by-page prose/UI pass** on the next page the operator chooses (home is done). On each
page touched, reconcile two things still owed from Conv 017–018: (a) the page's prose/voice to the new home
messaging, and (b) the "44 vs over 40" figure (`about.astro` + its "1982" anchor, `faq.astro`). When the
whole prose pass is complete, the `[SITE-CONSISTENCY]` sweep (whole-site voice + the SEO/AI-SEO/`llms.txt`/
`robots.txt` data structures) comes due. No un-gated CC build is queued — `[SITE-PERF]` waits on the full
image set, `[SITE-ANALYTICS]` is a fresh build to scope, and production waits on client sign-off.

⚠️ Production has **never been deployed** — all home changes are dev/staging-visible only; they do not
exist live until `[SITE-GO-LIVE]` (Phase 4). The home testimonials are **mock + SAMPLE-badged** and must be
swapped for real signed-off quotes (and the Gabriel-vs-masked attribution resolved) before go-live.

## 🔬 Carried findings
_None._
