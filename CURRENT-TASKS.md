# CURRENT-TASKS — fgw

**This file is the durable board state — CURRENT work only.** Keyed by `[CODE]` mnemonic (the sole
stable id; readable, hyphenated). One file, all sections (`DEC-000-4`); format from `fps-docs`
(`DEC-007-1`).

🔴 **Done work is not archived here (`DEC-000-7`, lean).** When a task completes, its row is deleted and
it drops to the one-line **✅ Completed tags** list at the bottom — the full record lives in the commit
messages, `DECISIONS.md` (`DEC-NNN-N`), and the per-conv records in `docs/convs/`. The board shows what
is **live**, not what is finished.

> **The board vs. the hopper.** [`HOPPER.md`](HOPPER.md) is spin-off capture — subject to scrutiny, not a
> commitment. A row here is a commitment. Hopper items are ruled at `/r-hopper` / `/r-end`.

---

## 🔥 Ordered

_None._ 🎉 **The site is LIVE** — `[SITE-GO-LIVE]` ✅ Conv 032: `frasergorrie.com` serves fgw-26 (apex
custom domain + `www` route over HTTPS, GA4 realtime confirmed, contact form delivering, old-URL
redirects live, email preserved). The Conv-007 critical path is **complete**. No ordered work remains;
the open threads are the Unordered rows below (`[SITE-HSTS]` hardening; `[SITE-TOOLS]` parked) and one
carried hopper item (secondary-button visibility).

---

## 📋 Unordered

### [CASE-RECORD-SIGNOFF] · promoted Conv 014 · sign-off ✅ Conv 030 (row stays for the standing masking guard)
✅ Sign-off complete (operator + clients checked both `/record` artifacts, no changes).
🔴 **Standing masking guard (why the row stays) — current as of Conv 034 (`DEC-034-1`):** the AI-era
testimonials are **live** (`showAiTestimonials = true`; `DEC-029-5`). **Gabriel's** testimonial runs under a
deliberate **testimonial-only naming exception**: it names **Gabriel + the Center for Unity** — he gave a
real, signed-off quote and cleared being named. The exception reaches no further than the testimonial text;
everything else the mask protects still holds:
- the `translation-platform` **case** stays de-identified (`DEC-023-3`) — no client, no source text, no target language on it;
- **no case-study link** sits on the testimonial — nothing may bridge the named quote to the de-identified case;
- the **target language is never named** anywhere;
- `discover-jesus` / `discover-the-ub` are unchanged.
**Brian** (marketplace) is unconstrained.
🔴 **Restore mechanism (if a real, signed-off testimonial later arrives):** add it to
`src/data/testimonials.json` and set `showAiTestimonials = true` in `index.astro` + `testimonials.astro`
to restore the suppressed sections + two-group lede (`DEC-029-5`); the masking guard above applies before
it renders. (Moved here Conv 032 from the retired `[SITE-GO-LIVE]` row.)
🔴 **Case → project mapping (lives here, never in the `fgw-26` site source):** `translation-platform` =
the translation-system/SPT engagement — client **The Center for Unity**, source text the **Urantia Book**
(the *same* client named publicly in the two Urantia cases, which is what the masking guard protects);
`learning-marketplace` = the **Peerloop** engagement.

### [SITE-TOOLS] · parked Conv 012
A dedicated tools page/surface — **parked.** The operator's summative tools statement already ships on
home (the "Tooling" section); a standalone page didn't earn its place ("not sure it will stand the test of
time; individual projects give a taste"). Seeded by the per-case **Built with** chips. Revisit only if a
fuller tools surface earns it.

### [SITE-HSTS] · promoted Conv 033 · security hardening, low priority
The live apex sends no `Strict-Transport-Security` header. HSTS would close the window where an on-path
attacker (same network as the visitor) intercepts the *first* plain-HTTP request and SSL-strips it before
the HTTP→HTTPS redirect. (Promoted Conv 033 from the hopper.)
**Likelihood: low for this site.** Static marketing site — no login, no sessions, no accounts; the only
user data in motion is a contact-form name/email/message, already sent over HTTPS. The attack needs an
attacker already positioned as MITM on the visitor's network and only touches the unprotected first
request; browsers increasingly default to HTTPS-first. The gain is marginal hardening — HSTS's real value
is for authenticated / sensitive-transaction sites, which this is not.
🔴 **If enabled, do it deliberately (hard to reverse):** start with a short `max-age` (~1 day), **no**
`includeSubDomains` / `preload` initially, ramp up only once confident — a browser that has cached a long
`max-age` stays pinned to HTTPS for that whole window even if HTTPS later breaks, with no HTTP fallback.
Routes: Cloudflare dashboard → SSL/TLS → Edge Certificates → HSTS (operator action), or a worker response
header (code).

## ⏸️ Parked

_None._

---

## ✅ Completed (tags — full records in commits / `DECISIONS.md` / `docs/convs/`)

- **Conv 034:** `[SITE-HEADER-TITLE]` ✅ — the page title now reveals in the sticky header once the H1
  scrolls off: inline beside the brand at ≥1024px, a full-width second row inside the header below that
  (keeps the horizontal nav down to 768px). Eyebrow styling (uppercase ember), `IntersectionObserver`
  re-bound across ClientRouter swaps, brand forced no-wrap, anchor `scroll-padding` bumped for the
  two-row header; home omits it. Plus hopper do-nows: masking exception recorded (`DEC-034-1`),
  orphaned `.sample-badge` CSS removed.
- **Conv 033:** Turnstile → "interaction-only" (hidden unless challenged; **deployed**) · robots.txt made
  single-source (disabled Cloudflare Bot Preference Sync; `Google-Extended` allow restored) · `/llms.txt`
  canonical trailing-slash links · **Gabriel Rymberg testimonial published** (home mask-safe pull-quote +
  full named quote on `/testimonials`, `#gabriel-rymberg` deep-link, AI-era section restored) — committed,
  **not yet deployed** · anchor `scroll-padding-top` fix · lede de-identification wording. (Hopper do-nows
  + fixes, not board rows.)
- **Conv 032:** `[SITE-GO-LIVE]` ✅ — DNS cutover complete; `frasergorrie.com` serves fgw-26 (apex custom
  domain + `www` route, MX/email left intact). Plus hopper do-nows (not board rows): contact-form
  ClientRouter submit fix, image brown-band fix, 6 old-URL 301 redirects, deploy-routes guard, lint debt.
- **Conv 031:** `[SITE-ANALYTICS]` · `[SITE-SOCIAL]` · `[SITE-PERF]` · `[SITE-OG-IMAGE]` · `[SITE-NARRATIVE]`
  (signed off) · `[CONTACT-TURNSTILE]` · `[SITE-GO-LIVE]` step 1 · `[CASE-MOCKUPS]` lightbox.
- **Earlier:** `[SITE-A11Y]` / `[CASE-RECORD-SIGNOFF]`* / `[NODE-FLOOR]` ✅ Conv 030 · `[SITE-CONSISTENCY]`
  ✅ 029 · `[CASE-MOCKUPS]` / `[CASE-DIAGRAMS]` / `[CASE-RECORD-REFRESH]` ✅ 025 · `[SITE-AI-SEO]` ✅ 016 ·
  `[SITE-SEO]` / `[SITE-CROSSLINK]` ✅ 015 · `[SITE-CONTACT]` / `[SITE-TESTIMONIALS]` / `[SITE-FAQ]` /
  `[SITE-HISTORY]` ✅ 013 · `[SITE-VISUAL]` ✅ 010 · `[SITE-PHASES]` ✅ 011 · `[SITE-ASSESS]` ✅ 009 ·
  `[SITE-DEPLOY-STAGING]` ✅ 008 · `[SITE-TEST-SETUP]` ✅ 006.
  (*`[CASE-RECORD-SIGNOFF]` row persists above for its standing masking guard.)
