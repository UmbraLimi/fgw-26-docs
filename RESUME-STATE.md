**Conv:** ended · **Machine:** MacMiniM4Pro · **Branch:** docs: `main`, code: `main`

## Where we left off

Conv 030 fixed the three `[SITE-A11Y]` WCAG gaps (deployed to staging `cb5f7d02`) and then ran an
operator-driven production-planning walkthrough that re-ordered the whole board. The **content side of
go-live is now done** — `[SITE-NARRATIVE]` is fully client-signed-off (Work cases + both `/record`
artifacts) and the `/privacy` legal-review gate was dropped. Also built this conv: the Home **Tooling**
statement, the `[NODE-FLOOR]` typecheck guard, and the `[CASE-MOCKUPS]` mobile case-layout refactor (all
committed, but **not yet deployed** — staging still holds only the a11y deploy).

🔥 Ordered now runs: **[SITE-NARRATIVE] (done) → [SITE-ANALYTICS] → [SITE-SOCIAL] → [SITE-PERF] →
[SITE-OG-IMAGE] → [SITE-GO-LIVE]**. `[SITE-GO-LIVE]` is gated only on operator DNS + go-ahead + the prod
`EMAIL_TO` secret.

## Next action

**Wire GA4 + rewrite `/privacy` the moment the operator provides the real `G-XXXXXXX` Measurement ID** —
this is the operator's stated near-term priority ("using GA today"); the approach is settled (`DEC-030-3`:
lean `gtag`, no banner, mirroring `fg`). While that's blocked, the actionable-without-operator work is
**(a)** deploy the committed Conv-030 work to staging so the Tooling section + mobile case layout are
visible, **(b)** `[SITE-SOCIAL]` footer links + JSON-LD `sameAs` (`x.com/frasergorrie`,
`linkedin.com/in/frasergorrie`), and **(c)** the directed **JSON-LD** work (a repo-side validator + a
per-page structured-data dump for Google's paste tool).

## 🔬 Carried findings
_None._
