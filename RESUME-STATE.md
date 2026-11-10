**Conv:** ended · **Machine:** MacMiniM4Pro · **Branch:** docs: `main`, code: `main`

## Where we left off

Conv 039 **built [SITE-CONTENT-HOME] dark** in `fgw-26`: the guides + writing hub-and-spoke
(`/guides/` cornerstones, `/writing/` dated articles — renamed from `/blog/`), all gated by one
`CONTENT_HOME_LIVE` flag (noindex + off-nav + sitemap-excluded; shown only in `astro dev`). Drafted and
**pending operator redline** (all `draft:true`): 3 cornerstone guides (Trust / Steering / Deciding) + 1
throwaway sample article. IA settled (`DEC-039-3`: "Guides"/"Writing", single-purpose pages, cross-linked);
nav trimmed (dropped "Home"; `DEC-039-5`), Phases added to footer, sticky-footer + back-link fixes. A
**production deploy ban** (`DEC-039-2`, fail-closed guard; staging exempt) holds until the content home is
finalised — so this conv's general fixes also wait for the flip. Decisions `DEC-039-1..5`.

## Next action

**Operator redlines the 3 guide drafts + the sample article** (in `fgw-26`, preview at the running
`astro dev` / localhost:4321); then **CC seeds `_cc/content-backlog.md`** with pillar-consistent topics
(the operator's stated plan, turn 9). Finalising the first article + all three guides is the gate: it
unblocks the flip-live hopper item (set `CONTENT_HOME_LIVE = true` + deploy) and lifts `[PROD-DEPLOY-BAN]`.

⚠️ **Human carry-over (still open):** the operator is to **send Gabriel the LinkedIn recommendation request**
(note + draft in `_cc/linkedin-makeover.md`).

## 🔬 Carried findings

_None._
