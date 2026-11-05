**Conv:** ended · **Machine:** MacMiniM4Pro · **Branch:** docs: `main`, code: `main`

## Where we left off

Conv 028 completed the page-by-page **prose review** — FAQ + Testimonials reworked with the operator
(voice/accuracy edits throughout; the redundant FAQ "Common concerns" note repurposed as a
Testimonials→FAQ cross-link). Two **accordion-legibility** styling changes landed on FAQ — group headings
lifted (weight 700 + accent underline rule) and open answers given a left accent bar (`DEC-028-1`) — and
the same grouping-heading rule was reused on the Testimonials time-period headings. Spelling standardised
on **UK** (`DEC-028-2`). All deployed to staging (version `4e10f27c`); production still never deployed.

## Next action

The page-by-page prose pass is complete, so the **pre-go-live quality sweep** is the natural next step:
**[SITE-CONSISTENCY]** (now ungated — also carries the site-wide UK-spelling sweep + the "honest/honestly"
reword, parts 6–7) and **[SITE-A11Y]** (ungated). Reason: both were gated on the prose pass, which just
finished, and both are wanted before `[SITE-GO-LIVE]`.

## ⚠️ Standing (all tracked on the board)

- Production has **never** been deployed (dev/staging only); home + Testimonials AI-era entries remain
  mock/SAMPLE.
- 🔴 `[SITE-GO-LIVE]` gates: **legal review** of `/privacy`; set the **production `EMAIL_TO` secret** once
  the prod worker exists; client sign-off; operator DNS + go-ahead.
- 🔴 `translation-platform` edits must not name the target language, source text, client org, or people
  (`DEC-023-3`); the home/Testimonials masking of Gabriel/marketplace quotes (`[CASE-RECORD-SIGNOFF]`).
- 🟡 FAQ "What have you been doing for {YEARS} years?" renders **44** vs home's "over 40" — operator chose
  to leave it (Conv 028); tracked in `[SITE-CONSISTENCY]`.

## 🔬 Carried findings

_None._
