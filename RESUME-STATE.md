**Conv:** ended · **Machine:** MacMiniM4Pro · **Branch:** docs: `main`, code: `main`

## Where we left off

Conv 014 overhauled the Work cases' **"The record"** feature (`[CASE-RECORD-OVERHAUL]`, done). Each of the
four audited cases was **re-audited by a fresh independent subagent** reading its own repo; the full
question-plus-answer **transcript** now renders read-only at `/work/<slug>/record` behind a button below the
summary, and the four public summaries were re-derived from the real audits (with corrected scale). The two
client transcripts (translation-platform, learning-marketplace) use **light typed-token redaction** with an
in-body legend (`DEC-014-2`); the two Urantia cases get a **"Visit the live site"** button instead of an
audit (`DEC-014-1`). `npm run verify` green, verified in the running product (light + dark), committed
(code `a43abba`, docs `e064147`). **Still HEAD-only — not yet on staging.** A key fact the audit surfaced:
the "confidential" translation client **is** The Center for Unity and the source text the Urantia Book — the
same client named publicly in the Urantia cases — so those redactions are mandatory.

## Next action

Build **`[SITE-CROSSLINK]`** (⚡ still top of 🔥 Ordered, untouched this conv): weave cross-links so the
footer-tier pages (Testimonials, FAQ, History, Work) are reachable by more paths than the footer alone
(`DEC-013-1` follow-on). Reason: it's the parked next-conv work the operator named and nothing displaced it.
Alternatively, **redeploy staging** to bring the new footer pages + the overhauled record transcripts live
there (staging still has only through the contact work).

⚠️ `[NODE-FLOOR]` persists — every `npm` command this conv needed a manual `nvm use 24` first.
🔴 `[CASE-RECORD-SIGNOFF]` (new row) — the two client summaries + transcripts need **client sign-off before
the production deploy**; a `[SITE-GO-LIVE]` pre-production gate now, not a dev/staging blocker.

## 🔬 Carried findings

_None._
