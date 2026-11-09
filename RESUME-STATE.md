**Conv:** ended · **Machine:** MacMiniM4Pro · **Branch:** docs: `main`, code: `main`

## Where we left off

Conv 035 was a long post-launch, multi-thread conv. **Deployed** the Conv-033/34/35 backlog to staging +
production (cleared the long-standing deploy block). **Aligned GSC** with the relaunched site: the
inherited property's submitted sitemap was the wrong URL (`sitemap.xml` → 404, starving indexing) —
submitted the correct `sitemap-index.xml`, removed the broken one, requested a homepage re-crawl, and
**linked GA4 ↔ Search Console**. Opened the **agent-discoverability initiative** (`AGENT-DISCOVERABILITY.md`
— be answerable by agents tasked to "find someone like me": a `.private` data model, public profile,
MCP plan). Built a **`/r-start` cadence mechanism** (fps port, `DEC-035-4`) that auto-surfaces periodic
checks. Secondary-button fix shipped (`DEC-035-1`). Decisions: `DEC-035-1`..`-4`.

## The board

- **🔥 Ordered (3):** `[GOOGLE-SERVICES]` is now a **standing every-3-convs monitor** (initial alignment
  done; next GSC check auto-surfaces at Conv 038). `[SOCIAL-MAKEOVER]` (X + LinkedIn) and `[POSTING-PLAN]`
  remain — these are the next *actionable* ordered work (2 → 3 dependency).
- **📋 Unordered:** `[SITE-HSTS]`, `[SITE-TOOLS]` (parked), `[CASE-RECORD-SIGNOFF]` (masking guard), plus
  4 new Conv-035 rows: `[SITE-CSP]`, `[SITE-STRUCTURED-DATA]`, `[SITE-CONSENT]`, `[SITE-WCAG22]`.
- **Agent initiative:** `AGENT-DISCOVERABILITY.md` §9 stages **6 proposed board rows** awaiting ruling
  (`[DATA-PRIVATE-SCHEMA]` keystone first). `[SITE-STRUCTURED-DATA]` overlaps `[AGENT-PROFILE]`.

## Next action

Recommended: start **`[SOCIAL-MAKEOVER]`** (the next actionable ordered task — X.com + LinkedIn property
makeovers to match the new site; feeds `[POSTING-PLAN]`). Alternatively, rule the agent-initiative's 6
proposed board rows and start the `[DATA-PRIVATE-SCHEMA]` keystone. 🔴 **Run `/r-hopper`** — 3 carried
items: email-auth fix (DMARC `p=none` + no apex SPF), `security.txt` Expires renewal, GEO answer-structuring.

## 🔬 Carried findings
_None._
