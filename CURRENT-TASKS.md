# CURRENT-TASKS — fgw

**This file is the durable board state.** Keyed by `[CODE]` mnemonic — the sole stable id. Codes are
**readable, hyphenated, up to ~10+ chars** (`SITE-DEPLOY-STAGING`, not `SDS`); collision → numeric
suffix. Format adopted from `fps-docs` (`DEC-007-1`); unlike fps, **every section — including
`📋 Unordered` — lives in this one file** (`DEC-000-4`).

📖 **Row format.** A substantial row leads with a plain-language `#### Status — Conv NNN` block a
non-author can scan in ten seconds (*what works · what's not built · what's buildable next*), with any
dense spec/build-log below it as the archive; the Status block's `Conv NNN` is its freshness stamp,
refreshed whenever the row is touched. Small rows don't need one. A gated / multi-phase row also carries
its continuity explicitly: what is **built**, what is **owed by the operator**, and the **deferred
remainder**.

> **The board vs. the hopper.** [`HOPPER.md`](HOPPER.md) is the hopper — spin-off capture during a conv,
> subject to scrutiny and *not* a commitment. A row here is a commitment. Hopper items are ruled at
> `/r-hopper` / `/r-end` — promote / do now / drop.

---

## 🔥 Ordered — index

⚡ = do next. Full detail in the task bodies below; the critical-path sequence sits between.

**Content + discoverability are ✅ done.** NARRATIVE (signed off), ANALYTICS (GA4 + the view-transition
page_view fix + `/privacy`, Conv 031), SOCIAL (footer X/LinkedIn + `sameAs`, Conv 031). What remains is
the run to production, **re-sequenced Conv 031** so the only irreversible step (the DNS cutover) is last
and the domain lands on the optimized, shareable site. Order (detail in the critical path below):

1. **Commit + push** Conv 031's work (SOCIAL + ANALYTICS) — production must deploy from pushed code.
2. **[SITE-GO-LIVE] step 1 — production worker (reversible)** ⚡ — deploy the prod worker, set the prod
   `EMAIL_TO` secret, verify on `*.workers.dev` (contact-form email + GA now live in prod). Does **not**
   touch `frasergorrie.com`; the legacy site keeps answering the domain.
3. **[SITE-PERF]** — image optimization (`fraser.jpg`, mockup PNGs → WebP/AVIF) + a Lighthouse/CWV pass +
   budget. Actionable now — images finalized Conv 030.
4. **[SITE-OG-IMAGE]** — a 1200×630 social-share card + wiring (`twitter:card` → `summary_large_image`).
   🔴 Needs an operator design call first — the one thing that can gate the cutover.
5. **[SITE-GO-LIVE] step 2 — DNS cutover (irreversible, LAST)** — operator DNS confirm + go-ahead; bind
   apex + `www`; cut `frasergorrie.com` from the legacy site to the prod worker. **Done-when:**
   frasergorrie.com serves fgw-26. (Legal-review gate dropped Conv 030.)

⚡ **Do-next — Conv 031:** **commit + push** this conv's work, then **[SITE-GO-LIVE] step 1** (deploy the
reversible production worker + prod `EMAIL_TO` secret + verify on `workers.dev`). Then **[SITE-PERF]**
(actionable now) and **[SITE-OG-IMAGE]** (needs the operator design call), and the **DNS cutover last**.
Done this conv: `[SITE-ANALYTICS]` (GA4 `G-EH3RJTF0VE`, production-only, + the view-transition page_view
fix for the case→`/record` funnel + per-page engagement time; `/privacy` reconciled) and `[SITE-SOCIAL]`
(footer X/LinkedIn + JSON-LD `sameAs`) — both deployed to staging, **uncommitted** pending step 1.
Remaining Unordered: `[SITE-TOOLS]` (parked) and the standing `[CASE-RECORD-SIGNOFF]` masking guard.

(**[SITE-ANALYTICS]** / **[SITE-SOCIAL]** ✅ Conv 031 · **[SITE-A11Y]** / **[CASE-RECORD-SIGNOFF]** / **[NODE-FLOOR]** ✅ Conv 030 · **[SITE-CONSISTENCY]** ✅ Conv 029 ·
**[CASE-DIAGRAMS]** / **[CASE-RECORD-REFRESH]** ✅ Conv 025 · **[SITE-AI-SEO]** ✅ Conv 016 ·
**[SITE-SEO]** / **[SITE-CROSSLINK]** ✅ Conv 015 · **[SITE-CONTACT]** ✅ Conv 013 ·
**[SITE-TESTIMONIALS]** / **[SITE-FAQ]** / **[SITE-HISTORY]** ✅ Conv 013 · **[SITE-DEPLOY-STAGING]** ✅ Conv 008 ·
**[SITE-ASSESS]** ✅ Conv 009 · **[SITE-VISUAL]** ✅ Conv 010 · **[SITE-PHASES]** ✅ Conv 011; all in
✅ Completed / conv records.)

---

## 🎯 Critical path — to fgw-26 live on Cloudflare at frasergorrie.com

Set Conv 007. The arc from the current scaffold (placeholder copy, now live on staging as of Conv 008)
to the real site serving at **frasergorrie.com**.

🔴 **This section is pure sequence + pointers.** Every step names an **existing** task by `[CODE]` or an
operator action; the row holds the work, detail, and done-condition — this holds the order *over* them,
not a second copy.

**Already true — NOT a gate:** the app is scaffolded (Astro 7 + Cloudflare Workers adapter + Tailwind
v4), `npm verify` green, WCAG AA verified, Node 24 baseline (all Conv 006); the staging deploy pipeline
is proven (Conv 008); real copy for all pages + Work cases (with independent "The record" blocks) is
drafted and live on staging (Conv 009); the **visual + voice pass** is done (`[SITE-VISUAL]` warm-
editorial refresh + a whole-site voice/humility pass + a real headshot, Conv 010); and the **Phases
self-qualification page** + a **sticky header** are built and on staging (`[SITE-PHASES]`, Conv 011);
and **SEO infrastructure + footer-tier cross-links** are built and on staging (`[SITE-SEO]` /
`[SITE-CROSSLINK]`, Conv 015), with staging held `noindex` (`DEC-015-1`); and **AI/LLM discoverability**
is built and on staging (`[SITE-AI-SEO]`, Conv 016 — `/llms.txt`, the AI-crawler policy, and
`FAQPage`/`OfferCatalog` JSON-LD). What's missing is (a) a deliberate perf pass (`[SITE-PERF]`), (b) the
production deploy + the domain.

### Phase 1 — Staging reachable *(prove the deploy pipeline)* — ✅ DONE Conv 008
- **1.0 — operator: clear Cloudflare auth** — ✅ done Conv 008 (`wrangler login`, OAuth).
- **1.1 — `[SITE-DEPLOY-STAGING]`** — ✅ done Conv 008. Deploy env-selection corrected to build-time
  `CLOUDFLARE_ENV` + a fail-closed resolved-name guard (`DEC-008-1`, correcting `DEC-007-2`'s wiring).
  Scaffold live + correct at `fgw-staging.fgorrie.workers.dev` (HTTP 200). CI stays deferred (`DEC-003-2`).

### Phase 2 — Publishable content *(the site must say something true)*
- **2.1 — `[SITE-NARRATIVE]`** — ✅ **done.** Real copy/messaging + de-identified `/work/<slug>` cases, live
  on staging; voice/humility pass Conv 010. **Fully client-signed-off** — Work cases Conv 029, the two
  `/record` artifacts Conv 030. Testimonials are upside, not a gate (`DEC-029-5`). Nothing content-side remains.
- **2.2 — `[SITE-PHASES]`** — ✅ built + on staging Conv 011. A new self-qualification page: the three
  phases a client goes through building with AI (straw/tin/steel man), so a prospect can place themselves
  and see the fit. Generic content — no client material, so not gated on sign-off; rides `[SITE-GO-LIVE]`
  to production like the rest of the content.

### Phase 3 — Findable & fast *(in place before the domain points at production)*
- **3.1 — `[SITE-SEO]`** — ✅ built Conv 015, on staging: astro `site:`, `@astrojs/sitemap` (styleguide
  excluded), a `robots.txt` endpoint (prod allow-all / staging `Disallow: /` + `noindex`, `DEC-015-1`),
  per-page canonical + `og:url` + Twitter card, `schema.org` JSON-LD (Person + ProfessionalService).
  Deferred remainder: a 1200×630 `og:image` (`[SITE-OG-IMAGE]`) — until then `twitter:card` is `summary`.
- **3.2 — `[SITE-AI-SEO]`** — ✅ built Conv 016, on staging: `/llms.txt` (Work section auto-generated),
  the production AI-crawler policy in the robots endpoint (`DEC-016-1` — search bots allowed, training-only
  declined), and machine-readable facts (`FAQPage` on `/faq` + `OfferCatalog`/`knowsAbout` on the global
  JSON-LD, via a reusable `<head>` slot). Shared the JSON-LD + crawlability work with 3.1.
- **3.3 — `[SITE-ANALYTICS]`** — ✅ built Conv 031: GA4 (`G-EH3RJTF0VE`), production-only, lean no-banner
  gtag; the view-transition page_view fix (powers the case→`/record` funnel + per-page engagement time);
  `/privacy` reconciled. Data only starts once production serves (prod-only gating).
- **3.4 — `[SITE-SOCIAL]`** — ✅ built Conv 031: footer X + LinkedIn links + JSON-LD `sameAs`.
- **3.5 — `[SITE-PERF]`** — 🔴 **remaining.** Page-speed as a tracked discipline: a Lighthouse / CWV pass +
  budget, plus image optimization (`fraser.jpg`, mockup PNGs → WebP/AVIF). Largely satisfied already
  (static + edge + near-zero JS). ✅ Un-gated Conv 030 (image set finalized) — **actionable now.**
- **3.6 — `[SITE-OG-IMAGE]`** — 🔴 **remaining.** The 1200×630 social-share card + wiring (`twitter:card`
  → `summary_large_image`). Needs an operator design call. Wanted before the cutover so launch shares via
  the new SOCIAL links carry a proper card.

### Phase 4 — Live at frasergorrie.com *(two steps; re-sequenced Conv 031)*
The production worker and the domain cutover are **split** so the only irreversible, outward-facing action
is last — and the domain lands on the PERF/OG-IMAGE-finished site.
- **4.1 — `[SITE-GO-LIVE]` step 1: production worker (reversible)** ⚡ **next.** Deploy the prod worker,
  set the prod `EMAIL_TO` secret (`fraser@frasergorrie.com`), verify on `*.workers.dev` — contact-form
  email delivery + GA4 now firing in prod. Does **not** touch the domain; reversible; testable in isolation.
- **4.2 — operator: confirm where `frasergorrie.com` DNS lives today** and whether/when its zone is in this
  Cloudflare account. The legacy `frasergorrie` site currently answers the domain.
- **4.3 — `[SITE-GO-LIVE]` step 2: DNS cutover (irreversible, LAST)** — a custom-domain/route binding
  (apex + `www`) + the DNS cutover from the legacy site. 🔴 **Outward-facing + hard to reverse** — needs an
  explicit operator go-ahead, never autopilot. Run only after PERF + OG-IMAGE. **Done-when:**
  frasergorrie.com serves fgw-26.

---

## 🔥 Ordered

### [SITE-NARRATIVE] · critical-path Phase 2

#### What it is
Build the site messaging/structure from `discovery/EVIDENCE-LEDGER.md`'s proof-points and the
`WORKING-METHOD.md` honesty frame (`DEC-000-6`), honouring the publishability map — de-identify all
client-owned material. The scaffold provides the routes + the `work`/`blog` content collections + the
component library to drop copy into; each `/work/<slug>` case is gated on its de-identification, so start
with the most showable (`redline` is fully clear). The copy must carry the **positioning thesis** below.

#### Positioning thesis — operator input, Conv 007 (the brief to draft from; not yet copy)
The guiding message for client attraction. Two halves, held deliberately **in balance** — the first
opens the door, the second must close it:

1. **The shift (worldview).** AI is upending a world where programmers were scarce, highly valued, and
   highly paid. Bespoke software — long too expensive to build per-business — is becoming viable for any
   organization, because AI now does much of the writing, deployment, and former IT work.
2. **FG's place + the reassurance (why pay FG).** FG uses intuitive judgment and the ability to *steer*
   AI development to help **small-to-medium companies and organizations** build their **own** bespoke
   software so their operations run well. 🔴 The reassurance half is load-bearing: the site must answer
   *why steering AI is a skill worth paying FG for* — rather than the buyer attempting it alone or hiring
   a cheaper AI-wrapper. That proof comes from the `WORKING-METHOD.md` honesty frame (`DEC-000-6`) + the
   `EVIDENCE-LEDGER.md` proof-points: the worldview is the hook, the evidence is the warrant.

Draft this at Phase 2, not now — it is held above the copy on purpose.

#### Status — Conv 009
**Bulk delivered, live on staging.** All five pages (Home, Method, Contact, About, nav) carry real copy,
and there are five Work cases — `redline`, `this-site` (fgw-26 itself), and the two de-identified client
cases — each with an independent **"The record"** assessment block (`[SITE-ASSESS]`). Biography verified
and recorded in `discovery/BIO-VERIFIED.md`; About in the lightly-warmed register. All live at
`fgw-staging.fgorrie.workers.dev` (Conv 009).

🔴 **Case → project mapping lives here, never in the `fgw-26` site source:** `translation-platform.md` =
the translation-system/SPT engagement; `learning-marketplace.md` = the Peerloop engagement.

**Voice/humility pass — ✅ done Conv 010.** Re-read every page + the four Work cases + the footer against
`reference/VOICE.md`; added a **humility rule** (`DEC-010-2`) and reframed the boastful "I know…" /
"before you do" / "a cheaper wrapper can't" framing site-wide. The Home hero was also re-led with the
**business identity** headline + a **44-year differentiator** (`DEC-010-3`).

**Home hero reworked — Conv 017.** New positioning h1 ("Custom software, designed with you — kept on
course by me."), a supporting deck, and a two-paragraph narrative under a "Where I come in" h2
(`DEC-017-1`); "44 years" → "over 40 years" on home (`DEC-017-3`); an em-dash footnote (`DEC-017-2`) and a
home-only tighter section rhythm (`DEC-017-4`). Supersedes the home-hero h1 + "44" specifics of
`DEC-010-3` (its flow-stepper/headshot/meet-Fraser structure still stands). Other pages' prose not yet
reconciled to this voice — per-page as reached.

**Work-case structure — Conv 023.** Every `/work` case now opens with a **"Why it matters"** section
(motivation, before "The problem"; `DEC-023-2`); narration follows the **I/we convention** (`DEC-023-1`);
`translation-platform`'s "ten languages" was de-emphasised (`DEC-023-3`).

**SPT (`translation-platform`) fully reworked — Conv 024.** Operator-driven prose tune across all sections
(incl. an async/Cloudflare-Workers production-ready close; billing dropped from body + `outcome` as
not-completed); three cases' "Why it matters" tuned; a new **"My response"** record section (Fraser's reply
to the audit, in voice); the real technical **Built with** stack; benefit reworded to clear the `DEC-023-3`
"~10 languages" residue; and the case's diagram replaced by the new **`segmentTable`** render type
(`DEC-024-2`). Local dev only — not deployed.

**Home refined further — Conv 018.** Operator-driven page pass on home: the four-step flow chart reworded
(the load-bearing idea is that big builds span multiple AI sessions and that needs managing); the
"Judgment in practice" band re-led as a question ("Where does my judgment come in?") with three
"It happens in…" cards on a new `scales` icon (`DEC-018-1`); "What I do" given a lead-in h2; "Find your
phase" reworded so progression past phase one reads as **not guaranteed** (`DEC-018-2`); the meet-Fraser
line shortened to "I'm Fraser"; and a new **"Recent testimonials" band** surfacing the two AI testimonials
shared from `src/data/testimonials.json`, SAMPLE-badged (`DEC-018-3`). Live on staging (deploy Conv 018).
Other pages still pending reconciliation; consistency sweep tracked as `[SITE-CONSISTENCY]`.

**Content-complete + fully signed off (Conv 030):**
- ✅ **Urantia cases — done Conv 013:** added as two named, public Work cases (`/work/discover-jesus`,
  `/work/discover-the-ub`) for The Center for Unity — live-URL proof, no "The record" block.
- ✅ **Client sign-off — complete.** De-identified Work cases Conv 029; the two `/record` artifacts Conv 030
  (`[CASE-RECORD-SIGNOFF]`). De-identification/masking still governs (`DEC-023-3`). Testimonial quotes are
  upside, not a gate (`DEC-029-5`). **Nothing content-side remains before production.**
- **Conv 030 — Home "Tooling" statement added** (eyebrow `Tooling` + h2 "The tools I reach for"): the
  operator's summative tools note, single-sourced on home (the `[SITE-TOOLS]` page idea stays parked).

**Source material (Conv 008):** `discovery/NARRATIVE-SOURCE-GEMINI.md` (Gemini synthesis, historical);
the honesty frame + evidence came from `discovery/WORKING-METHOD.md` + `discovery/EVIDENCE-LEDGER.md`.

### [SITE-PERF] · critical-path Phase 3 · opened Conv 009

✅ **Un-gated Conv 030** — the operator confirmed the current image set is finalized, so the
image-optimization leg (the substantive part) can now proceed alongside the measurement/budget leg. Both
legs are actionable.

#### What it is
Page speed as a tracked discipline rather than a happy accident (audit Conv 009). **Already good by
construction:** static output on Cloudflare's edge, near-zero JS (one hydrated island, `ThemeToggle`),
immutable `Cache-Control` on `/_astro/*`, small Tailwind v4 CSS. **Not yet deliberate:** a Lighthouse /
Core Web Vitals pass + a budget, and image optimization — `public/fraser.jpg` is a real ~330 KB photo
served unoptimized on three spots (Home hero avatar + band, About), and the Cloudflare `IMAGES` binding
is enabled but unused. The lightest of the three — but gated on the full image set (above).
🔴 **Also unoptimized (Conv 022):** `src/mockups/*.png` product screenshots served via plain `<img>` (no
`astro:assets` pipeline) — `redline.png` is 1000×1796 / ~344 KB into an ~288 px slot; this pass should
resize + convert these to WebP/AVIF too ([CASE-MOCKUPS] deferred its optimization here).

### [SITE-ANALYTICS] · ordered Conv 030 (promoted from Unordered; opened Conv 018)

#### Status — Conv 030 — GA4 is a go; blocked on the Measurement ID
Operator is standing up Google Analytics "today" (Conv 030). Plan mirrors the current live site's approach
found in `fg` — a basic `gtag` snippet, **no consent banner**, paired with a plain privacy disclosure:
wire GA4 into the Layout `<head>`, and **rewrite the `/privacy` "Analytics and cookies" section with it**
(the two move together). 🔴 **Blocked on the real `G-XXXXXXX` Measurement ID** — `fg` carried only the
`GA_MEASUREMENT_ID` placeholder (commented out). EU-consent caveat noted; no banner unless the operator asks.

#### Deferred remainder (the original "what should it teach us" half)
Event + funnel design — the clicks/paths worth tracking (hero CTAs → `/contact`, `/work` + `/phases` nav,
the phases self-qualification funnel). The provider question is settled (GA4). (hopper → Conv 018)

### [SITE-SOCIAL] · ordered Conv 030 (promoted from Unordered; opened Conv 012)
Operator idea-set item 8: "redo LinkedIn and X." **Scope resolved Conv 030** (URLs read from `fg`): the
buildable part is adding **X** (`x.com/frasergorrie`) + **LinkedIn** (`linkedin.com/in/frasergorrie`) links
to the footer (icon + `sr-only` label, as `fg`'s footer does) + a `sameAs` array on the Person JSON-LD.
Actionable now — no operator input needed. (Redoing the off-site profiles themselves is separate — the
operator's own accounts.)

### [SITE-OG-IMAGE] · ordered Conv 030 (promoted from Unordered; opened Conv 015)
A 1200×630 branded social-share card, the deferred remainder of `[SITE-SEO]` (Conv 015). Build the asset,
then wire it into `og:image` + `twitter:image` and bump `twitter:card` from `summary` to
`summary_large_image` in `src/layouts/Layout.astro`. 🔴 Needs a design asset / operator call on the card's
look before any wiring. Blocks nothing — SEO works without it; wanted before `[SITE-GO-LIVE]`.

### [SITE-GO-LIVE] · opened Conv 007 · critical-path Phase 4 · split into two steps Conv 031

#### What it is
Take fgw-26 to production on Cloudflare and point **frasergorrie.com** at it — **split Conv 031 into two
steps** so the only irreversible action is last:
- **Step 1 — production worker (reversible):** deploy the prod worker (the top-level `wrangler.jsonc`
  name) + set the prod `EMAIL_TO` secret; verify on its `*.workers.dev` URL. Does not touch the domain.
- **Step 2 — DNS cutover (irreversible, LAST):** a custom-domain/route binding for the apex (+ `www`) +
  the DNS cutover from the legacy site. Run only after `[SITE-PERF]` + `[SITE-OG-IMAGE]`.

#### Status — Conv 031 (plain language)
Unblocked and sequenced. Content + discoverability are done (NARRATIVE/ANALYTICS/SOCIAL). **Step 1 is the
do-next** once this conv's work is committed + pushed. 🔴 **Step 2 is outward-facing + hard to reverse**
(it takes the domain off the live legacy `frasergorrie` site) — needs an explicit operator go-ahead, never
autopilot. The operator has confirmed they're fine losing the legacy fallback (Conv 031), so the ordering
is about launching on the finished site, not about reversibility.

#### Owed by the operator (when Phase 3 opens)
- Where `frasergorrie.com` DNS lives today + whether/when its zone moves into this Cloudflare account.
- The go-ahead for the cutover itself.

#### 🔴 Pre-production content gates (not for dev/staging)
- ✅ **No longer a go-live blocker (Conv 029).** The two MOCK AI-era testimonials never arrived and may not
  (operator, Conv 029). Both the home **"Recent testimonials" band** and the `/testimonials` **"In the AI era"
  section** are now **suppressed** behind a `showAiTestimonials = false` flag (markup intact in `index.astro`
  + `testimonials.astro`); the `/testimonials` lede is flag-gated too (single-group wording while off). The
  site can go live without them. 🔴 **If a real, signed-off quote later arrives:** add it to
  `src/data/testimonials.json` and set `showAiTestimonials = true` in both files to restore the sections +
  the two-group lede — and the `[CASE-RECORD-SIGNOFF]` attribution-masking ruling applies before it renders.
- ✅ **Client sign-off on the de-identified Work cases — Conv 029** (both clients, no changes). Testimonial
  quotes are **not a gate** — the AI-era section is suppressed (`DEC-029-5`); real quotes are upside only.
- ✅ **Client sign-off on the two `/record` artifacts — Conv 030** (operator + clients checked both; no
  changes) — `[CASE-RECORD-SIGNOFF]` complete. This clears the last content sign-off gate.
- Turnstile spam hardening on the contact form — `[SITE-CONTACT]`.
- ✅ **Legal review — dropped Conv 030.** The operator deems `/privacy` adequate (no lawyer). 🔴 Still live:
  when `[SITE-ANALYTICS]` wires GA4, the `/privacy` "no analytics/cookies" section must be rewritten **with**
  it (the two move together) — tracked on the `[SITE-ANALYTICS]` row.
- **Production `EMAIL_TO` secret** — set it to `fraser@frasergorrie.com` via `wrangler secret put` once the
  production worker exists (Conv 027). `EMAIL_FROM`=fraser@ and staging `EMAIL_TO`=fraser@ are done +
  Resend-verified; only the prod inbox secret remains (can't be set until prod is deployed).

---

## 📋 Unordered

### [CASE-RECORD-SIGNOFF] · promoted Conv 014 · sign-off ✅ Conv 030
✅ **Sign-off complete (Conv 030):** operator + clients checked both `/record` artifacts
(`/work/translation-platform/record`, `/work/learning-marketplace/record`) — no changes. The production
sign-off gate is cleared.
🔴 **Standing masking guard (still live — why the row stays):** the translation-platform client is The
Center for Unity and the source text is the Urantia Book — the *same* client named publicly in the two
Urantia cases. If the suppressed AI-era testimonials (`DEC-029-5`) are ever restored, **Gabriel's** quote
must not name Gabriel / CFU / the Urantia source text / the target language (`DEC-023-3`); a Conv-029
pro-forma template exists for him to fill. **Brian** (marketplace) is unconstrained.

### [SITE-TOOLS] · promoted Conv 012
Operator idea-set item 7: a "tools" **page/surface** — ambiguous between a tools/stack page, the tech stack,
or the tools FG uses to steer AI. **Conv 030:** the operator's *summative* tools statement now ships on
**home** (the "Tooling" section — see `[SITE-NARRATIVE]`); a dedicated page is left parked ("not sure it
will stand the test of time; individual projects give a taste"). Seeded by the per-case **Built with**
chips. Revisit only if a fuller tools surface earns its place.

## ⏸️ Parked

_None._ (`[SITE-TEST-SETUP]` completed Conv 006; its gate — the scaffold — is satisfied.)

## ✅ Completed this conv

### Conv 030 — [SITE-A11Y] WCAG review + 3 fixes; board re-ordered toward production; NODE-FLOOR fixed; Home Tooling statement
- **[SITE-A11Y] — full WCAG AA review done + 3 gaps fixed, deployed to staging (`cb5f7d02`).** The site was
  already strong; the three fixes (`DEC-030-1`): **F1** placeholder contrast
  (`--faint`→`--subtle`, WCAG 1.4.3); **F2** form-input border (new `--field-border` token, WCAG 1.4.11);
  **F3** contact-form per-field error association (`aria-describedby` + blur `aria-invalid` + messages,
  WCAG 3.3.1). All verified in the running product (served HTML/CSS + live F3 blur, incl. real-keystroke
  `tooShort`); typecheck green.
- **[CASE-RECORD-SIGNOFF] — sign-off complete** (operator + clients checked both `/record` artifacts, no
  changes). Clears the last content sign-off gate. The row's standing masking guard is retained (see row).
- **[NODE-FLOOR] — fixed.** `.nvmrc` already existed; added a `pretypecheck` `check-node.mjs` guard so
  `npm run typecheck` fails loud with "run `nvm use`" on Node 22 instead of a cryptic astro error — verified
  live under Node 22. (Root cause — the shell's global nvm default being 22 — is a machine setting left to
  the operator: `nvm alias default 24`.)
- **Home "Tooling" statement added** (`[SITE-NARRATIVE]`) — eyebrow + h2 "The tools I reach for", the
  operator's summative tools note, single-sourced on home; verified rendering. `[SITE-TOOLS]` page idea parked.
- **Board re-ordered toward production (operator walkthrough):** `[SITE-ANALYTICS]` (GA4), `[SITE-SOCIAL]`,
  `[SITE-OG-IMAGE]` promoted into 🔥 Ordered; the `[SITE-GO-LIVE]` **legal-review gate dropped** (operator:
  `/privacy` adequate); `[SITE-PERF]` **un-gated** (images finalized).
- **[CASE-MOCKUPS] — resolved + closed.** The one open residual (the `/work` case mobile stacking order)
  is fixed: restructured the case grid into a 3-part layout (`.case-grid`/`.case-lead`/`.case-extra`) — on
  mobile it stacks **lead (mockup/diagram + benefit) → prose → tools**; desktop grid-areas reassemble the
  sticky two-column sidebar unchanged. `CaseExtras` split via a `part` prop. Verified in the running product
  (DOM order + desktop screenshot); typecheck green.
- **Queued / pending (not done this conv):** GA4 wiring + `/privacy` rewrite (🔴 blocked on the real
  Measurement ID — `fg` had only a placeholder); the directed **JSON-LD** work (repo-side validator + a
  per-page structured-data dump); `[SITE-SOCIAL]` footer links (`x.com/frasergorrie`,
  `linkedin.com/in/frasergorrie` + JSON-LD `sameAs`).

_(Conv 029 and earlier: see `docs/convs/` records + `DECISIONS.md`.)_

