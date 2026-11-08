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
the open threads are the two carried hopper items (`Turnstile-hide`, `HSTS`) and the Unordered rows.

---

## 📋 Unordered

### [CASE-RECORD-SIGNOFF] · promoted Conv 014 · sign-off ✅ Conv 030 (row stays for the standing guard)
✅ Sign-off complete (operator + clients checked both `/record` artifacts, no changes).
🔴 **Standing masking guard (why the row stays):** if the suppressed AI-era testimonials (`DEC-029-5`) are
ever restored, **Gabriel's** quote must not name Gabriel / CFU / the Urantia source text / the target
language (`DEC-023-3`); a Conv-029 pro-forma template exists for him to fill. **Brian** (marketplace) is
unconstrained.
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

## ⏸️ Parked

_None._

---

## ✅ Completed (tags — full records in commits / `DECISIONS.md` / `docs/convs/`)

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
