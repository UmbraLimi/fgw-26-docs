**Conv:** ended · **Machine:** MacMiniM4Pro · **Branch:** docs: `main`, code: `main`

## Where we left off

Conv 011 built **`[SITE-PHASES]`** — a new `/phases` self-qualification page (the three phases a client
goes through building with AI: **straw man → tin man → steel man**), so a prospect can place themselves
and judge the fit. It ships with a **"Phases"** nav item, a **Home banner** ("Where are you in building
with AI?" → `/phases`), and a site-wide **sticky header** (`DEC-011-2`). The page is dual-natured by
operator direction (describes FG's process *and* maps the reader's journey) and written to `VOICE.md`
(humility rule). All live on staging (`fgw-staging.fgorrie.workers.dev`, version `47b7bce4`), verified
light + dark; `npm run verify` green (11 pages). Nothing in production. Also fixed a Node papercut: the
nvm `default` alias was `22.19.0` (below floor) → set to `24.22.1` (`DEC-011-3`).

## Next action

Open **`[SITE-SEO]`** (critical-path Phase 3, the ⚡ top of the board): astro `site:`, `@astrojs/sitemap`,
`robots.txt`, canonical + `og:url`/`og:image`, `schema.org` JSON-LD — all additive, dev/staging only.
Reason: the content + visual + phases layers are done and staged; "findable & fast" (SEO → AI-SEO →
PERF) is the last pre-go-live phase before the domain cutover. **Note:** `/phases` (and the sticky
header) still want an **operator review of the live staging page**; a new page means the sitemap work in
`[SITE-SEO]` should now include `/phases`. `[SITE-PERF]` reminder still stands: `public/fraser.jpg` is a
~330 KB unoptimized photo on three spots.

## 🔬 Carried findings

_None._
