**Conv:** ended · **Machine:** MacMiniM4Pro · **Branch:** docs: `main`, code: `main`

## Where we left off

Conv 027 was a page-by-page **prose review** with the operator: **About, History, Contact, and Method**
reworked (client-facing voice, partnership framing, a de-abstracted Method), and `translation-platform`'s
"judgment that mattered" + frontmatter reconciled to the AI-leapfrog / hiatus arc (`DEC-027-1`). Four
features shipped alongside and were deployed to **staging**: a **pricing anchor** ($10K–$150K qualifier on
the Phases close + a FAQ entry, `DEC-027-2`), a new **`/privacy`** page + footer link (`DEC-027-3`), a
**contact-form** all-fields-required submit gate + the first **backend-endpoint test suite** (`DEC-027-4`),
and the contact **email unified** to `fraser@frasergorrie.com` (Resend-verified end-to-end on staging,
`DEC-027-6`). Method's heading icons were removed for prose-page consistency (`DEC-027-5`).

## Next action

**Finish the prose review** — **FAQ** and **Testimonials** are the two pages the operator deferred to next
conv (same method: show the current page beside its `fg` counterpart, surface differences as observations,
operator dictates the edits). Once the prose pass is complete, `[SITE-CONSISTENCY]` and the new `[SITE-A11Y]`
row (both gated on it) become runnable as the pre-go-live quality sweep.

## ⚠️ Standing

- Production has **never** been deployed (dev/staging only); home testimonials remain mock/SAMPLE.
- 🔴 New `[SITE-GO-LIVE]` pre-production gates this conv: **legal review** of the `/privacy` copy (CC-drafted,
  not lawyer-reviewed; also revise its "no analytics/cookies" section when `[SITE-ANALYTICS]` wires a
  provider), and set the **production `EMAIL_TO` secret** to `fraser@frasergorrie.com` (can't be done until
  the prod worker exists). `EMAIL_FROM` + staging `EMAIL_TO` are already fraser@ and Resend-verified.
- 🔴 Future edits to `translation-platform` must **not** name the target language, source text, client org,
  or people (`DEC-023-3`).
- 🔴 The `this-site` audit publicly frames the fps case's confidentiality work ahead of its build
  (`DEC-020-3`) — ruled acceptable; reconcile or let stand before go-live.
- 🟡 "over 40 vs 44" residue: the FAQ "What have you been doing for {YEARS} years?" still interpolates **44**
  vs home's "over 40" (tracked in `[SITE-CONSISTENCY]`).

## 🔬 Carried findings

_None._
