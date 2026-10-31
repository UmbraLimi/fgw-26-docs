**Conv:** ended · **Machine:** MacMiniM4Pro · **Branch:** docs: `main`, code: `main`

## Where we left off

Conv 015 shipped `[SITE-SEO]` and `[SITE-CROSSLINK]` (both pre-brownout; the conv resumed under its own
number after a power loss), then added a **staging-noindex gate** (`DEC-015-1`): staging builds serve
`robots.txt` `Disallow: /` + a site-wide `noindex` meta, keyed on build `MODE`, with `public/robots.txt`
now a prerendered endpoint `src/pages/robots.txt.ts`. The **whole Conv 015 batch (SEO + cross-links +
noindex) was redeployed to staging and verified live** (`fgw-staging.fgorrie.workers.dev`). Production is
unchanged (allow-all, indexable). Phase 3's SEO leg is done; what remains in Phase 3 is AI/LLM
discoverability and a deliberate perf pass.

## Next action

Build **`[SITE-AI-SEO]`** (⚡ top of 🔥 Ordered, Phase 3) — operator-named next build. LLM/generative-engine
discoverability: `llms.txt`, structured machine-readable facts, an explicit AI-crawler policy in the
`robots.txt` endpoint. Reason: it reuses the JSON-LD + crawlability machinery `[SITE-SEO]` just laid down,
and the `robots.txt` endpoint is now the natural home for the AI-crawler policy.

⚠️ `[NODE-FLOOR]` persists — every `npm` command this conv needed a manual `nvm use 24` first.
⚠️ The staging-noindex gate is **build-time**: any env's robots/noindex only changes on that env's next
deploy. Production is currently allow-all + indexable (correct), but it is **not yet deployed** — prod has
never been deployed at all (that is `[SITE-GO-LIVE]`, Phase 4).

## 🔬 Carried findings

_None._
