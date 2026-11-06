**Conv:** ended · **Machine:** MacMiniM4Pro · **Branch:** docs: `main`, code: `main`

## Where we left off

Conv 029 (ad hoc) completed the full 7-part **[SITE-CONSISTENCY]** review: vertical rhythm reconciled
site-wide (`DEC-029-1`), UK spelling swept across prose + metadata **and** the client-approved Work cases
(`DEC-029-2`), four "honest"-assertion rewords (`DEC-029-3`), unique per-page meta descriptions on
home/about/method/contact/phases (`DEC-029-4`); all deployed + verified on staging (version `0dcb567e`).
Also: **client sign-off** on the de-identified Work cases received (both clients, no changes), clearing the
Work-case leg of the production sign-off gate; the two **AI-era testimonials suppressed** on home +
`/testimonials` behind a `showAiTestimonials` flag as they never arrived (`DEC-029-5`); and **pro-forma
testimonial templates** drafted for Gabriel + Brian (in the Conv 029 record, for the operator to hand to
clients).

## Next action

**[SITE-A11Y]** — the full WCAG AA review across the whole site, now the last ungated pre-go-live quality
row (consistency is done). Reason: it was gated on the prose pass (finished Conv 028), it pairs with
`[SITE-GO-LIVE]`, and it can now check against settled copy.

## ⚠️ Standing (all tracked on the board)

- Production has **never** been deployed (dev/staging only). The home + `/testimonials` **AI-era
  testimonial sections are now suppressed** (behind `showAiTestimonials = false`), not mock/SAMPLE —
  restore by adding a real signed-off quote to `testimonials.json` and flipping the flag.
- 🔴 `[SITE-GO-LIVE]` gates: **legal review** of `/privacy`; set the **production `EMAIL_TO` secret** once
  the prod worker exists; **client sign-off** — Work cases done (Conv 029), residual: testimonial quotes +
  the two `/record` artifacts (`[CASE-RECORD-SIGNOFF]`); operator DNS + go-ahead.
- 🔴 `translation-platform` edits must not name the target language, source text, client org, or people
  (`DEC-023-3`); the Gabriel pro-forma testimonial must be vetted for this masking before any site use
  (`[CASE-RECORD-SIGNOFF]`). Brian (Peerloop) is not under this constraint.
- 🟡 FAQ "What have you been doing for {YEARS} years?" renders **44** vs home's "over 40" — operator chose
  to leave the career-length variation as-is (ruled no-change, Conv 029).

## 🔬 Carried findings

_None._
