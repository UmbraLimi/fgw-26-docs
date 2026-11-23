**Conv:** 057 ended · **Machine:** MacMiniM4Pro · **Branch:** docs: `main`, code: `main`

## Where we left off

Conv 057 **shipped the guides-only launch** (`DEC-056-3`): the 3 cornerstone guides (Trust / Steering /
Deciding) are **live on frasergorrie.com** (Version `b8abe635`) — indexed, in the sitemap, in nav/footer.
The crux was splitting `CONTENT_HOME_LIVE` into two flags (`DEC-057-1`): `CONTENT_HOME_LIVE=true` lights
the guides, a new **`WRITING_LIVE=false`** holds the dated writing stream dark. A launch-blocker was caught
in the build output — the guides were still `draft:true` so prod generated only the hub, not the pages;
flipped `draft:false`. `/blog` → `/guides/` 301 (`DEC-057-2`); `[PROD-DEPLOY-BAN]` amended + lifted
(`DEC-057-3`). `npm run verify` passed; verified live. `[SITE-CONTENT-HOME]`, `[BLOG-REDIRECT]`,
`[PROD-DEPLOY-BAN]` retired; `[WRITING-BUILDOUT]` promoted.

## Next action

🔁 **Run `[POSTING-PLAN]`** — now unblocked by live guides to point at. Draft the launch announcement(s)
for LinkedIn (biweekly cadence) + opportunistic X echo, per `reference/CHANNELS.md` pillars; CC drafts →
operator approves → publish. **Reason:** the guides exist to earn GEO/credibility and feed the funnel; the
launch is the natural moment to distribute. Two quick wins also unblocked and worth folding in: **GSC
request-indexing** for the 4 new guide URLs (speed the first crawl; full cadence is Conv 59) and the
**Rich-Results validation** now that the guides are live/crawlable (`[SITE-STRUCTURED-DATA]`).

## 🔬 Carried findings

_None._
