**Conv:** ended · **Machine:** MacMiniM4Pro · **Branch:** docs: `main`, code: `main`

## Where we left off

Conv 013 finished **`[SITE-CONTACT]`** (operator provisioned the Resend secrets; staging redeployed and the
**live round-trip verified** — a real email landed) and built the footer "explore mode" content set under the
new two-tier IA (`DEC-013-1`): **`/testimonials`** (current live set + 2 SAMPLE-badged AI-era mocks),
**`/faq`** (15 dev-only Q&As), **`/history`** ("From sea to software"), plus **two named/public Urantia Work
cases** (`/work/discover-jesus`, `/work/discover-the-ub`). The big discovery: the `frasergorrie` repo is a
frozen-2023 snapshot — the **current** live site lives at `~/projects/fg` (Astro 5), now adopted as the
authoritative reference (`DEC-013-3`) + a working dir. Everything committed, `npm run verify` green, each page
verified live (light + dark). **Not yet on staging** — only the contact work was deployed this conv; the new
pages are HEAD-only.

## Next action

Build **`[SITE-CROSSLINK]`** (⚡ next): the `DEC-013-1` follow-on — weave cross-links so the footer-tier pages
(Testimonials, FAQ, History, Work cases) are reachable by more paths than the footer alone. Reason: it's the
parked next-conv work the operator named. Alternatively, **redeploy staging** first to bring the new footer
pages + Urantia cases live there (staging currently has only through the contact work).
⚠️ `[NODE-FLOOR]` persists — every `npm` command this conv needed a manual `nvm use 24` first.

## 🔬 Carried findings

_None._
