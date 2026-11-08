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

**One thing left before cutover: the DNS cutover itself** (`[SITE-GO-LIVE]` step 2) — fully operator-gated.
Everything else is built and deployed to prod + staging: content + discoverability (NARRATIVE, ANALYTICS,
SOCIAL, PERF, OG-IMAGE) and `[CONTACT-TURNSTILE]` (Cloudflare Turnstile on the contact form — verified
end-to-end Conv 031: enforced, widget passes a real human, email delivered).

### [SITE-GO-LIVE] · opened Conv 007 · critical-path Phase 4 · split into two steps Conv 031

#### What it is
Take fgw-26 to production and point **frasergorrie.com** at it — **split into two steps** so the only
irreversible action is last:
- **Step 1 — production worker (reversible):** ✅ **done Conv 031.** Prod worker at
  `fgw.fgorrie.workers.dev` (secrets uploaded, GA4 live, HTTP 200); contact pipeline verified end-to-end
  (test POST → `{ok:true}`, operator confirmed inbox arrival). Domain untouched.
- **Step 2 — DNS cutover (irreversible, LAST):** a custom-domain/route binding (apex + `www`) + the DNS
  cutover from the legacy site. 🔴 **Outward-facing + hard to reverse** — needs explicit operator
  go-ahead, never autopilot. The operator is fine losing the legacy fallback (Conv 031), so the ordering
  is about launching on the finished site, not reversibility.

#### 🙋 Operator ask-points (asked when reached, one at a time)
- **DNS location** — where `frasergorrie.com` DNS lives today + whether/when its zone is in this
  Cloudflare account. Legacy `frasergorrie` currently answers the domain.
- **Cutover go-ahead** — explicit, never autopilot.

#### 🔎 Post-cutover verification (on the real domain, with the operator)
- apex + `www` both serve fgw-26 over HTTPS (valid cert); the `www`↔apex redirect holds.
- Contact form delivers on the real domain (one test → `fraser@frasergorrie.com`).
- **Analytics end-to-end:** GA4 **realtime** receives a page_view from a live browser, the **case→`/record`
  funnel** fires (the page_view-on-client-nav fix), and per-page engagement time shows. First real traffic
  GA sees (prod-only gating).
- `og:image` resolves (card previews when the live URL is shared); `robots.txt` serves the prod allow-all
  policy and the site is no longer `noindex`.

#### 🔴 Pre-production gates — remaining
- **Turnstile (`[CONTACT-TURNSTILE]`)** — ✅ **done Conv 031** (built, deployed, verified end-to-end). 🔴
  **Cutover prerequisite:** the Turnstile widget's Hostname Management list MUST include `frasergorrie.com`
  + `www.frasergorrie.com`, or the contact form 110200-errors on the live domain. Confirm before cutover.
- 🔴 **Standing: if a real, signed-off testimonial quote later arrives** — add it to
  `src/data/testimonials.json` and set `showAiTestimonials = true` in `index.astro` + `testimonials.astro`
  to restore the suppressed sections + two-group lede (`DEC-029-5`); the `[CASE-RECORD-SIGNOFF]`
  attribution-masking ruling applies before it renders.
- ✅ All other gates cleared: client sign-offs (Work cases Conv 029, `/record` Conv 030), legal review
  dropped (Conv 030), `/privacy` + GA4 reconciled (Conv 031), prod `EMAIL_TO` set (Conv 031).

#### 🔵 Watch — crawlable `workers.dev` pre-cutover (Conv 031)
The live prod worker is indexable (robots allow-all, no `noindex`). Low, mitigated risk — canonical/
`og:url`/sitemap all point to `frasergorrie.com` and the URL is unlinked/obscure. Pages are prerendered,
so a runtime host `noindex` won't work; proper gating needs an `X-Robots-Tag: noindex` for the
`workers.dev` host (Cloudflare/worker level). **Act only if the pre-cutover window runs long** — otherwise
the cutover resolves it.

---

## 🎯 Critical path — fgw-26 live at frasergorrie.com

Set Conv 007. **Phases 1–3 are ✅ all done** — scaffold + proven staging deploy (Conv 006–008),
publishable signed-off content (Conv 009–030), and findable & fast: SEO + AI-SEO + analytics + social +
perf + OG-image (Conv 015–031). Full detail in `docs/convs/` + `DECISIONS.md`. **Only Phase 4 remains.**

🙋 **marks an operator ask-point** — asked when the step is reached, one at a time, never batched ahead.

🔵 **Standing deploy rule (operator instruction, Conv 031):** until the domain cutover, **every production
deploy is mirrored to staging** (and vice versa) so the two stay identical — only the intentional env
differences remain (staging `noindex` + GA gated off). Both are currently on the same build
(prod `8d29ee36` / staging `dde13427`). Rule expires at cutover. → DEC at `/r-end`.

### Phase 4 — Live at frasergorrie.com *(two steps; re-sequenced Conv 031)*
- **4.1 — step 1: production worker (reversible)** — ✅ done Conv 031 (see `[SITE-GO-LIVE]`).
- **4.2 — DNS location** — 🙋 ask the operator (see `[SITE-GO-LIVE]` ask-points).
- **4.3 — step 2: DNS cutover (irreversible, LAST)** — 🙋 go-ahead, then post-cutover live checks.
  **Done-when:** frasergorrie.com serves fgw-26.

---

## 📋 Unordered

### [CASE-RECORD-SIGNOFF] · promoted Conv 014 · sign-off ✅ Conv 030 (row stays for the standing guard)
✅ Sign-off complete (operator + clients checked both `/record` artifacts, no changes).
🔴 **Standing masking guard (why the row stays):** if the suppressed AI-era testimonials (`DEC-029-5`) are
ever restored, **Gabriel's** quote must not name Gabriel / CFU / the Urantia source text / the target
language (`DEC-023-3`); a Conv-029 pro-forma template exists for him to fill. **Brian** (marketplace) is
unconstrained.
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

- **Conv 031:** `[SITE-ANALYTICS]` · `[SITE-SOCIAL]` · `[SITE-PERF]` · `[SITE-OG-IMAGE]` · `[SITE-NARRATIVE]`
  (signed off) · `[CONTACT-TURNSTILE]` · `[SITE-GO-LIVE]` step 1 · `[CASE-MOCKUPS]` lightbox.
- **Earlier:** `[SITE-A11Y]` / `[CASE-RECORD-SIGNOFF]`* / `[NODE-FLOOR]` ✅ Conv 030 · `[SITE-CONSISTENCY]`
  ✅ 029 · `[CASE-MOCKUPS]` / `[CASE-DIAGRAMS]` / `[CASE-RECORD-REFRESH]` ✅ 025 · `[SITE-AI-SEO]` ✅ 016 ·
  `[SITE-SEO]` / `[SITE-CROSSLINK]` ✅ 015 · `[SITE-CONTACT]` / `[SITE-TESTIMONIALS]` / `[SITE-FAQ]` /
  `[SITE-HISTORY]` ✅ 013 · `[SITE-VISUAL]` ✅ 010 · `[SITE-PHASES]` ✅ 011 · `[SITE-ASSESS]` ✅ 009 ·
  `[SITE-DEPLOY-STAGING]` ✅ 008 · `[SITE-TEST-SETUP]` ✅ 006.
  (*`[CASE-RECORD-SIGNOFF]` row persists above for its standing masking guard.)
